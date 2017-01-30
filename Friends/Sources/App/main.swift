import Vapor
import VaporPostgreSQL

let drop = Droplet()
drop.preparations.append(Friend.self)

do {
    try drop.addProvider(VaporPostgreSQL.Provider.self)
} catch {
    assertionFailure("Error adding provider: \(error)")
}

drop.get("friends") { req in
    let friends = try Friend.all().makeNode()
    let nodeDictionary = ["friends": friends]
    
    return try JSON(node: nodeDictionary)
}

drop.get("friends", Int.self) { req, userID in
    guard let friend = try Friend.find(userID) else {
        throw Abort.notFound
    }
    return try friend.makeJSON()
}

drop.post("friend") { req in
    var friend = try Friend(node: req.json)
    try friend.save()
    return try friend.makeJSON()
}

drop.run()
