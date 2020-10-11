class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.timestamp :start_time
      t.timestamp :end_time
      t.integer :player_limit
      t.string :location
      t.string :skill_level
      t.string :status
      t.text :description
      t.boolean :cancelled
      t.references :user, null: false, foreign_key: true
      t.references :sport, null: false, foreign_key: true

      t.timestamps
    end
  end
end
