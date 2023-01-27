class ArticlesController < ApplicationController
  before_action :authenticate_user!
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
    @article.build_mon_image
  
  end

  def create
   
    @article = Article.new(article_params)

    if @article.save
     
    
      redirect_to @article
    else
      @article.build_mon_image
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    
    @article = Article.find(params[:id])
    @article.build_mon_image unless @article.mon_image
  end




  def update
    @article = Article.find(params[:id])
    if params[:mon_images_attributes].present?
    
      @article.mon_images.update(image: params[:mon_images_attributes][:image])
    end
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

 

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  def article_params
    #params.require(:article).permit(:title, :body, :mon_image)
   # params.require(:article).permit(:title, :body, mon_image_attributes: [:id, :image])
   params.require(:article).permit(:title, :body, mon_image_attributes: [:id, :image])
    #params.require(:article).permit(:title, :body, mon_image: [])
 

  end
end