class SitemapsController < ApplicationController
  def show
    request.format = "xml" 
    @news = News.find(:all, :order => "updated_at DESC", :limit => 50000)
    headers["Content-Type"] = "text/xml"
    headers["Last-Modified"] = @news[0].updated_at.httpdate
    render layout: false
  end
end
