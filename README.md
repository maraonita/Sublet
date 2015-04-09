##README

##Local testing instructions
- `bundle`
- `brew install imagemagick` (image validation stuff)
- `rake db:migrate`
- `rake db:seed`
- Make sure Procfile and .env file exist and contain correct vars
	- Procfile should say `web: bundle exec rails s`
	- .env should have:
		- `SECRET_KEY_BASE=c64cfa5b5ce8e4a05562f0886728ecc27cf9b913caed9610bfa1dbddc99f8091cae5a80968063f75eb2c4536b48bc4eb1838bd981aea4fc38f9e0158793336d1`
		- `GMAIL_DOMAIN=gmail.com`
		- `GMAIL_USERNAME=yourgmail@gmail.com`
		- `GMAIL_PASSWORD=yourpassword`
	- with the mail settings updated to the address you want mail to be sent from.
	- note: using non gmail account will require additional settings update in development.rb
	- _DO NOT_ use the same SECRET_KEY_BASE in production.
- run `foreman start`

##Production use
- Make sure all environment (config) variables are correctly set in the heroku app settings tab
	- Mailer settings can be changed using the config variables in heroku. You must also edit the mailer settings in production.rb if not using Gmail.
- Procfile should say `web: bundle exec rails s -p $PORT`
- App is located at `subit.herokuapp.com`
- To update, push to `https://git.heroku.com/subit.git`