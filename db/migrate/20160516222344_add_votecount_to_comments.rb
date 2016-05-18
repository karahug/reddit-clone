class AddVotecountToComments < ActiveRecord::Migration
  def change
    add_column :comments, :votecount, :integer
  end
end
