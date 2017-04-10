# fantastic-waffle
Real time web chat with funny responses

For this project you will need `redis` and `postgres` besides a  Google Oauth2 keys

put your keys at `.env` file

```
GOOGLE_CLIENT_ID=
GOOGLE_CLIENT_SECRET=
```

Configure `config/database.yml` to you database configuration
```
development:
  <<: *default
  database: translated_chat_development
  username: translated_chat
    password: <%= ENV['TRANSLATED_CHAT_DATABASE_PASSWORD'] %>
```

Create database and execute migrations
```
rake db:create
rake db:migrate
```
Execute server
```
rails s
```
Execute sidekiq

```
bundle exec sidekiq
```


Preferably login app with you Google Identity