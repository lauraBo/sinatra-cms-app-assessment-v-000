# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app (app uses the gem 'sinatra' and gem 'sinatra-activerecord')
- [x] Use ActiveRecord for storing information in a database (uses the gem 'activerecord' and gem 'sinatra-activerecord'. app has a database set up through a series of migrations. Two classes inherit from ActiveRecord::Base)
- [x] Include more than one model class (list of model class names e.g. User, Post, Category) - Two model classes : Dog and User 
- [x] Include at least one has_many relationship on your User model (x has_many y, e.g. User has_many Posts) - User has many Dogs 
- [x] Include at least one belongs_to relationship on another model (x belongs_to y, e.g. Post belongs_to User) Dog belongs to User 
- [x] Include user accounts ( User Class has the ablity to signup and create accounts)
- [x] Ensure that users can't modify content created by other users ( The Helper methods in ApplicationController use 'session'  to verify user using ID authentification)
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying ( Dogs Controller contains routes for 4 CRUD actions)
- [x] Include user input validations (Dog class "validates_presence_of :user_id, :breed, :name, :age, :shelter" . User class "validates_presence_of :username, :email" 
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new) Flash messages are included in route methods to notify user when they do not have access to page or when invalid information is inputted to login to account.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
