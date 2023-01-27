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
        comment = Comment.new(commenter:params[:commenter],body:params[:body], article_id:params[:article_id], status:params[:status])
        
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