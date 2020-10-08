class AddTitletoActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :title, :string
  end
end
