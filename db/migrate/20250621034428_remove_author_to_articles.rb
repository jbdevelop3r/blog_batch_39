class RemoveAuthorToArticles < ActiveRecord::Migration[7.2]
  def change
    remove_column :articles, :author
  end
end
