class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
    @article.mon_images.build
  end

  def create
    @article = Article.new(article_params)
    if @article.save
     
      if params[:mon_image].present? && params[:mon_image][:image].present?
       # MonImage.create(imageable: @article, image: params[:mon_image][:image])
       
       @mon_image = @article.create_mon_image(image: params[:mon_image][:image])
       #image = ImageProcessing::MiniMagick.source(@mon_image.image.attach.path)
      #### @article.mon_images.create(image: params[:mon_image][:image])
      

      end
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
    @article.mon_images.build
  end

  def update
    @article = Article.find(params[:id])
    if params[:mon_images_attributes].present?
      @article.mon_images.create(image: params[:mon_images_attributes][:image])
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
    params.require(:article).permit(:title, :body, mon_images_attributes: [:id, :image])
    #params.require(:article).permit(:title, :body, mon_image: [])
 

  end
end