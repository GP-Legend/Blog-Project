class CommentsController < ApplicationController

  http_basic_authenticate_with name: "Ethan", password: "12345", only: :destroy
  #Now, only authenticated users can delete comments.

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article), status: :see_other
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end
end

#You'll see a bit more complexity here than you did in the controller for
#articles. That's a side-effect of the nesting that you've set up. Each request
#for a comment has to keep track of the article to which the comment is
#attached, thus the initial call to the find method of the Article model to get
#the article in question.

#In addition, the code takes advantage of some of the methods available for an
#association. We use the create method on @article.comments to create and save
#the comment. This will automatically link the comment so that it belongs to
#that particular article.
