class ChangeCommentNameToCommenter < ActiveRecord::Migration[7.2]
  def change
    rename_column :comments, :comment_name, :commenter
  end
end
