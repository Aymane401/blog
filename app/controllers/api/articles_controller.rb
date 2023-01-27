class Api::ArticlesController < ApiController

    def index
        articles = Article.all
        render json: articles
    end

    def show
        article = Article.find_by(id:params[:id])
        render json: article
    end

    def create
        article = Article.new(title:params[:title],body:params[:body],status:params[:status])
        article.save
    end

    def destroy
        article = Article.find_by(id:params[:id])
        article.delete
    end
end