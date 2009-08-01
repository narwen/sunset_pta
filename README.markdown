# Sunset PTA

## Deploying to Heroku

I've set up a Heroku app at [http://sunset-pta.heroku.com/](http://sunset-pta.heroku.com/). These are my notes on getting set up to deploy. Note that if you already have a Heroku account set up, you will be able to skip some of these steps.


### Get GitHub working

Before you can deploy to Heroku, you should make sure you are able to push to GitHub. See the first few articles in the [GitHub Guides](http://github.com/guides/home) for more info. You may use the same SSH key you use for GitHub to deploy to Heroku.



### Get a Heroku account

If you don't already have a Heroku account, you'll need to get one. You should've received an invite to Heroku from me by e-mail. Let me know if you need another invite, or if you want to use a Heroku account at a different e-mail address.



### Install the Heroku gem

`sudo gem install heroku`



### Heroku creds

Now that the gem is installed, do `heroku keys`. It should ask for your Heroku username and password, and then upload your SSH public key to Heroku. If for some reason it doesn't upload the key, you can add it manually with `heroku keys:add /path/to/your/key.pub`. If you are working on multiple computers with different public keys, you will need to do this on each of those computers.



### Get git to talk to Heroku

In your clone of the `sunset_pta` repository, do `git remote add heroku git@heroku.com:sunset-pta.git`. Now, when you've made commits in your clone and are ready to deploy them, you can `git push heroku master` (...or `git push heroku foobranch:master` if you're not working on a local master branch). When Heroku receives the commits, it will print out some info about what happened. If you crashed the server, it will tell you so, and show you where to see the crash message.



### Migrating the database

If your commits included database migrations, you will need to do `heroku rake db:migrate` to migrate the database on the Heroku server.



### Installing new gems

If your commits relied on any new gems, you may need to add them to the `.gems` file in the root of the `sunset_pta` repository. More info is in the [Heroku docs](http://docs.heroku.com/gems#gem-manifest).



### I broke it!

If you broke Heroku, you might be able to get some idea about what's wrong by running `heroku logs`.