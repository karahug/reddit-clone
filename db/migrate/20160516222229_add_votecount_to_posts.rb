class AddVotecountToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :votecount, :integer
  end
end
