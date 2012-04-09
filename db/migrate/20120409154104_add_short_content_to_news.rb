class AddShortContentToNews < ActiveRecord::Migration
  def change
    add_column :news, :content_short, :text
  end
end
