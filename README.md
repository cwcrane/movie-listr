# movie-listr

This is a simple app that gets a searched movie from the omdb API, and allows a user to save a rating for that movie. If the user already has a rating for the movie, the saved rating will be returned. 

While I initially learned to code by building 2 rails apps, it's been 3+ years since I worked with rails (and Ruby). So I spent a decent amount of time re-familiazrizing myself with the language, framework, and some of the syntax with ActiveRecord, and thus didn't get as far as I wanted. It was a fun assignment though and I made keep working on it anyways.  

## With more time, here's what I'd do next:
* allow comments to be submitted along with rating.
* html view and associated api endpoint to show all user ratings.
* allow user to update/delete ratings within that view.
* Authentication: currently the app just assumes you are user_id=1. I need to build in an account setup and authentication step. Every api request would be autheticated, and the user_id set in the ruby Users class to be used for selects/updates/inserts. 
* As I add more front end code, I would clean up the ajax calls, particularly the response handling in ".done" by moving this logic to functions. 
* move some of the view alteration logic to functions. 

## Running the app:
The app has a separate directory for the front and back ends. The back end is rails and connected to postgres.
I was not able to deploy the app to Heroku in the time I had. To test it, you'll need to clone the repo, create the DB in postgres, migrate and seed the DB. 
```
rake db:create
rake db:migrate
rake db:seed
```

Then run "rails server" in the back end rails app. 
```
rails server
```
And a separate localhost server for the front end page, eg: 
```
ruby -run -e httpd . -p5000
``` 


