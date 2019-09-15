class ChangeNeighborhoodColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :restaurants, :neighborhood, :location
  end
end
