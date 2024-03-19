class AddFieldsToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :title, :string
    add_column :books, :author, :string
    add_column :books, :genre, :string
    add_column :books, :height, :integer
    add_column :books, :publisher, :string
  end
end
