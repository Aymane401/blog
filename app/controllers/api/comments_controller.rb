class Api::CommentsController < ApiController

    def index
        articles = Article.find_by(id:params[:id]);

        if articles
            comments = articles.comments
            render json: comments.to_json()
        else
            render json:" Failed"
        end 
    end

    def show
        comment = Comment.find_by(id:params[:id])
        render json: comment
    end

    def create
        comment = Comment.new(comment_params)
        
        if comment.save
            render json: "success"
        else
            render json: "failed"
        end
    end

    def destroy
        comment = Comment.find_by(id:params[:id])

        if comment
            comment.delete
            render json: "success"
        else
            render json: "failed"
        end
    end
end

private
  def comment_params
    params.permit(:commenter, :body, :article_id, :status)
  end