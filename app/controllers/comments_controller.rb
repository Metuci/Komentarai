class CommentsController < ApplicationController



  def create
    @comment = Comment.new(comment_params)
    @article = Article.find(params[:id])
    @comment.article = @article

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @article, notice: 'Komentaras sukurtas, atsiras greitu metu :)' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { redirect_to root_url, notice: 'Komentaro sukurti nepavyko. Gal dėl to, kad nėra ką kurti?' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  protected
    def comment_params
      params.require(:comment).permit(:name, :content)
    end

end
