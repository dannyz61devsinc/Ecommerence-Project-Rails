# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:
    
* Ruby version 2.7.0p0

* Rails version 5.2.8.1

* Configuration

* Database
 postgresql

* Database initialization
  rails db:create
  then
  rails db:migrate
                   will create database. and migrate all schema
  more you can use 
  rails db:drop to drop all tables etc.

* Extra Gems
gem 'pundit'  for policy and restrictions
gem 'ransack'   for text searching on page
gem 'stripe'    for payments of product 
gem 'stripe-rails'   for connection to stripe in rails 
gem 'image_processing' for image processing to in rails
gem 'cloudinary'      for uploading images on cloud

*Credentials

you need following credential  to use this app
stripe
cloudianry

* How to run the test suite

* Services
stripe service used to create session of checkout of product in app/services


* Deployment instructions

* ...
