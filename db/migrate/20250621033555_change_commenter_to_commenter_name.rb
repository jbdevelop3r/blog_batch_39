class ChangeCommenterToCommenterName < ActiveRecord::Migration[7.2]
  def change
    rename_column :comments, :commenter, :comment_name
  end
end
