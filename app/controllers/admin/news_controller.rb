class Admin::NewsController < Admin::AdminController

  def index
    @news = News.order("created_at desc").paginate(:per_page => per_page, :page => page)
  end

  def show
    @news = News.find(params[:id])
  end

  def edit
    @news = News.find(params[:id])
  end

  def new
    @news = News.new
    render :edit
  end

  def create
    @news = News.new(params[:news])

    respond_to do |format|
      format.html do
        if @news.save!
          redirect_to admin_news_path(@news)
        end
      end
    end
  end

  def update
    article_updated = false
    News.find(params[:id]).tap { |news|
      article_updated = news.update!(news_params)
    }

    respond_to do |format|
      format.html do
        if article_updated
          redirect_to(admin_news_path(params[:id]), notice: "Artykuł został pomyślnie zaktualizowany.")
        else
          render action: :edit
        end
      end
    end
  end

  def destroy
    @news = News.find(params[:id])
    @news.destroy
    redirect_to(admin_news_url)
  end

  private

  def news_params
    params.require(:news).permit(:title, :content, :content_short)
  end
end
