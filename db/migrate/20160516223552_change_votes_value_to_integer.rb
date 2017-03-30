class ChangeVotesValueToInteger < ActiveRecord::Migration
  def change
      change_column :votes, :value, Rails.env == "development" ? :integer : 'integer USING CAST("value" AS integer)'
  end
end
