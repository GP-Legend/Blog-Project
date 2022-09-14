class ArticlesController < ApplicationController

  #For an explanation of this line, see the very bottom of the file.
  http_basic_authenticate_with name: "Ethan", password: "12345", except: [:index, :show]
  #That password is a nuclear launch code, believe it or not. Do not share it
  #with anyone!

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end
  #The show action calls Article.find (mentioned previously) with the ID
  #captured by the route parameter. The returned article is stored in the
  #@article instance variable, so it is accessible by the view. By default,
  #the show action will render app/views/articles/show.html.erb.

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    #We are now using article_params because typing in every parameter one by
    #one every time they are needed is bound to cause big problems later on.
    #It is better to just cover all of them with a simple 'article_params'.
    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end
  #redirect_to will cause the browser to make a new request, whereas render
  #renders the specified view for the current request. It is important to use
  #redirect_to after mutating the database or application state. Otherwise,
  #if the user refreshes the page, the browser will make the same request, and the
  #mutation will be repeated.

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end
  #Notice how the edit and update actions resemble the new and create actions.

  #The edit action fetches the article from the database, and stores it in
  #@article so that it can be used when building the form. By default, the edit
  #action will render app/views/articles/edit.html.erb.

  #The update action (re-)fetches the article from the database, and attempts to
  #update it with the submitted form data filtered by article_params. If no
  #validations fail and the update is successful, the action redirects the
  #browser to the article's page. Else, the action redisplays the form — with
  #error messages — by rendering app/views/articles/edit.html.erb.

  def destroy

    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end
end




#From now on, no more multiline comments. They just keep causing trouble. Maybe
#this issue is exclusive to Rails?


#If you were to publish your blog online, anyone would be able to add, edit and
#delete articles or delete comments.

#Rails provides an HTTP authentication system that will work nicely in this
#situation.

#In the ArticlesController we need to have a way to block access to the various
#actions if the person is not authenticated. Here we can use the Rails
#http_basic_authenticate_with method, which allows access to the requested
#action if that method allows it.

#To use the authentication system, we specify it at the top of our
#ArticlesController in app/controllers/articles_controller.rb. In our case, we
#want the user to be authenticated on every action except index and show, so we
#write that: (See above for the 'http_basic_authenticate_with')
