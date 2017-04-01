class AddTracksToRecords < ActiveRecord::Migration[5.0]
  def change
    add_column :records, :tracks, :string
  end
end
