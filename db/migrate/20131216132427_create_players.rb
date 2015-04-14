class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :player_name
      t.string :college
      t.integer :number
      t.references :team

      t.timestamps
    end
    add_index :players, :team_id
  end
end
