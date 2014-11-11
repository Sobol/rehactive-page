class News < ActiveRecord::Base
  def short_body_without_html
    Nokogiri::HTML(self.content).css('body').text.squeeze(" \n")[0..100]
  end
end
