Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "articles#index"

  resources :articles do
    resources :comments
    #This creates comments as a nested resource within articles. This is another
    #part of capturing the hierarchical relationship that exists between
    #articles and comments.
  end

  #The resources method also sets up URL and path helper methods that we can use
  #to keep our code from depending on a specific route configuration. The values
  #in the "Prefix" column above plus a suffix of _url or _path form the names of
  #these helpers. For example, the article_path helper returns
  #{}"/articles/#{article.id}" when given an article. We can use it to tidy up
  #our links in app/views/articles/index.html.erb: (go to that file to see it)

  #With the model in hand, you can turn your attention to creating a matching
  #controller. Again, we'll use the same generator we used before:

  #$ bin/rails generate controller Comments

  #IMPORTANT! Some of the information below is outdated as the two get routes
  #ended up getting replaced as I continued through the tutorial.
  #get "/articles", to: "articles#index"
  #get "/articles/:id", to: "articles#show"
  #The new route (the one I pasted on line 5) is another get route, but it has
  #something extra in its path:
  #:id. This designates a route parameter. A route parameter captures a segment
  #of the request's path, and puts that value into the params Hash, which is
  #accessible by the controller action. For example, when handling a request
  #like GET http://localhost:3000/articles/1, 1 would be captured as the value
  #for :id, which would then be accessible as params[:id] in the show action of
  #ArticlesController.
  # Defines the root path route ("/")
  # root "articles#index"
end

#Also, multiline comments break the code in this file for some reason. Oh well.
#Not like typing out octothorpes is hard.
