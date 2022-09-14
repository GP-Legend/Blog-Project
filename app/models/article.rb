class Article < ApplicationRecord

  include Visible
  has_many :comments
  #This is the "other side" of an association in the ruby programming language.
  #If something belongs to something else, then that something else also
  #needs to have the aforementioned thing. So, in this instance, the comments
  #belong to the articles. An article can have many comments, thus the
  #association is complete.

  #So, in the future, DO NOT FORGET ABOUT MAKING SURE THAT ALL ASSOCIATIONS
  #ARE COMPLETED.

  #From the site: These two declarations enable a good bit of automatic
  #behavior. For example, if you have an instance variable @article containing
  #an article, you can retrieve all the comments belonging to that article as
  #an array using @article.comments.

  validates :title, presence: true
  validates :body, presence: true, length: {minimum: 10 }



  #def archived?
  #  status == 'archived'
  #end
  #This code is now obsolete thanks to 'include Visible'
end

#The first validation declares that a title value must be present. Because title
#is a string, this means that the title value must contain at least one
#non-whitespace character.

#The second validation declares that a body value must also be present.
#Additionally, it declares that the body value must be at least 10 characters
#long.

#You may be wondering where the title and body attributes are defined. Active
#Record automatically defines model attributes for every table column, so you
#don't have to declare those attributes in your model file.
