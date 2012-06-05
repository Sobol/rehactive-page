xml.instruct! :xml, :version => '1.0', :encoding => 'UTF-8'

# create the urlset
xml.urlset :xmlns => 'http://www.sitemaps.org/schemas/sitemap/0.9' do
  
  if @entries.present?
    @entries.each do |entry|
      xml.url do
        xml.loc url_for(:controller => 'news',
                        :action => 'show',
                        :id => entry.id,
                        :only_path => false)
        xml.lastmod entry.updated_at.to_date
      end
    end
  end
  
  
  xml.url do
    xml.loc root_url
  end
  
  xml.url do
    xml.loc about_page_path
  end
  
  xml.url do
    xml.loc new_contact_path
  end
  
  xml.url do
    xml.loc offer_page_path
  end
  
  xml.url do
    xml.loc offer_page_path
  end
  
  xml.url do
    xml.loc map_page_path
  end
  
  xml.url do
    xml.loc news_index_path
    if @entries.present?
      xml.lastmod @entries.last.updated_at.to_date
    end
  end
end
