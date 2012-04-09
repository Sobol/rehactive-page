class CreateConnect < ActiveRecord::Migration
  def up
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.text :content

      t.timestamps
    end
  end

  def down
    drop_table :contacts
  end
end
