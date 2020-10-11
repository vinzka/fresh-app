class AddSportReferenceToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :sport, null: false, foreign_key: true
  end
end
