class CreateNews < ActiveRecord::Migration
  def up
    create_table :news do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end

  def down
    drop_table :news
  end
end
