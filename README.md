# Nelson (work in progress)

Nelson is an ongoing side project to enhance my skills and implement new technology. It is a trading game which
allows the user to trade forex currency pairs on a training account. Built in Ruby on Rails, it uses the 1forge.com
API to get live trading data every three minutes or immediately for each trade.

## Getting started

Test the application here: [Live Demo of Nelson](http://nelson-says.herokuapp.com)

### Run the app on your own server
Stack used:
```
Ruby 2.4.1
Rails 5.2.0
```

### Installing
```
bundle install
bundle update
rake db:create
rake db:migrate
rake db:seed
```

The application is now ready to use.
To run your server:
```
rails s
```

Open your web browser and navigate to
```
localhost:3000
```

## Current features include (as of last commit of README file)
 * login / sign-up as user
 * cash account
 * trading accounts
 * valuations update every 3 minutes by running clock job and 1forge.com API
 * buy or sell function
 * basic leaderboard based on money in cash_account

## Future goals

* adding CI via Circle CI
* add nice front-end design and JS notifications to direct user (e.g. using sweet-alert)
* add GraphQL endpoint to get current leaderboard and/or account details for user


---- AI implementation ------
* AI stage 1: implement a machine learning algorithm which will initially, give trading advice
* AI stage 2: implement AI to trade autonomously and compete against other users
* AI stage 3: implement plug to live trading account and let AI trade real money 

## Contribute

If you want to get involved, feel free to contact me on:
[@rayk](mailto:rayk.platzek@gmail.com)
