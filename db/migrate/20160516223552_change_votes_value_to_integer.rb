class ChangeVotesValueToInteger < ActiveRecord::Migration
  def change
    change_column :votes, :value, 'integer USING CAST("value" AS integer)'
  end
end
