class RefactorDatabase < ActiveRecord::Migration[6.0]
  def change
    remove_column :activities, :status
    remove_reference :users, :sport, index: true
    remove_column :users, :skill_level
    change_column :activities, :cancelled, :boolean, default: false
  end
end
