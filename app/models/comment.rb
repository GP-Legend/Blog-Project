class Comment < ApplicationRecord
  include Visible
  
  belongs_to :article
end
#This is very similar to the Article model that you saw earlier. The difference
#is the line belongs_to :article, which sets up an Active Record association.

#This file and the ones that came with it were created by the following command.
#Make sure that it is typed into the base of whatever the main file of the
#application is. For example, this was done INSIDE of the 'blog' folder:
#bin/rails generate model Comment commenter:string body:text article:references

#The (:references) keyword used in the shell command is a special data type for
#models. It creates a new column on your database table with the provided model
#name appended with an _id that can hold integer values. To get a better
#understanding, analyze the db/schema.rb file after running the migration.
