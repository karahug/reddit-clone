class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :value

      t.timestamps null: false
    end
  end
end
