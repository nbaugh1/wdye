class AddDescriptionToVisit < ActiveRecord::Migration[5.2]
  def change
    add_column :visits, :description, :text
  end
end
