class CreateSportUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :sport_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :sport, null: false, foreign_key: true
      t.string :skill_level

      t.timestamps
    end
  end
end
