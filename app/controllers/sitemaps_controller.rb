class SitemapsController < ApplicationController
  def show
    render layout: false
    request.format = "xml" 
    @entries = News.find(:all, :order => "updated_at DESC", :limit => 50000)
    headers["Content-Type"] = "text/xml"
    headers["Last-Modified"] = @entries[0].updated_at.httpdate
  end
end
