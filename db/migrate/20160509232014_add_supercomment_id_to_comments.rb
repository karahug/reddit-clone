class AddSupercommentIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :supercomment_id, :integer
  end
end
