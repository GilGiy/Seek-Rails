class CreateCommentsSecondTime < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text   :content
      t.timestamps null: false
      t.integer :post_id
    end
  end
end
