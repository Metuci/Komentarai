class CommentsController < ApplicationController



  def create
    @comment = Comment.new(comment_params)
    @article = Article.find(params[:id])
    @comment.article = @article

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @article, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { redirect_to root_url, notice: 'Comment was not created, it was a big fail.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  protected
    def comment_params
      params.require(:comment).permit(:name, :content)
    end

end
