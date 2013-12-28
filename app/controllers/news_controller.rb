class NewsController < ApplicationController
  
  def index
    @news = News.order("created_at desc").paginate(:per_page => per_page, :page => page)
  end
  
  def show
    @news = News.find(params[:id])
  end
end
