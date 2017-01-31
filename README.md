# Friends API

This project uses Swift, XCode, Vapor, Vapor Toolbox, Postgres and Heroku.

GET: https://friends-api-123.herokuapp.com/friends  
GET: https://friends-api-123.herokuapp.com/friends/id

POST: https://friends-api-123.herokuapp.com/friend  
Example of expected body:
```json
{
    "name": "John Doe",
    "age": 20,
    "email": "john@email.com"
}
```

Note: The Heroku instance will fall asleep after 30 min inactivity, so the first ping might be slow, since it needs to wake up.

## 📖 Documentation

Visit the Vapor web framework's [documentation](http://docs.vapor.codes) for instructions on how to use this package.

