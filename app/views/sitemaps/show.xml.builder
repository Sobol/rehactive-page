xml.instruct! :xml, :version => '1.0', :encoding => 'UTF-8'

# create the urlset
xml.urlset :xmlns => 'http://www.sitemaps.org/schemas/sitemap/0.9' do
  
  @news.each do |n|
    xml.url do
      xml.loc url_for(:controller => 'news',
                      :action => 'show',
                      :id => n.id,
                      :only_path => false)
      xml.lastmod n.updated_at.to_date
    end
  end
  
  
  xml.url do
    xml.loc root_url
  end
  
  xml.url do
    xml.loc about_page_url
  end
  
  xml.url do
    xml.loc new_contact_url
  end
  
  xml.url do
    xml.loc offer_page_url
  end
  
  xml.url do
    xml.loc map_page_url
  end
  
  xml.url do
    xml.loc news_index_url
    xml.lastmod @news.last.updated_at.to_date
  end
end
