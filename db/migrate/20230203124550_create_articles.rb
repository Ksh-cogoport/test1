class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.string :category
      t.string :body
      t.date :published_date
      
      t.timestamps
    end
  end
end
