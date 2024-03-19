class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :book_title
      t.string :book_author
      t.text :book_description
      t.date :publication_date
      t.string :isbn
      t.string :book_publisher
      t.integer :genre_id

      t.timestamps
    end
  end
end
