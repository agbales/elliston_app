class FixDrcIdName < ActiveRecord::Migration[5.0]

    def self.up
      rename_column :records, :drc_ids, :drc_id
    end

    def self.down
      rename_column :records, :drc_id, :drc_ids
    end

end
