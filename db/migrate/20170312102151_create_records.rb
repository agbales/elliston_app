class CreateRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :records do |t|
      t.string :drc_ids
      t.string :collection
      t.string :author
      t.string :location
      t.string :year
      t.string :date
      t.string :date_digitized
      t.string :date_issued
      t.string :description_html
      t.string :description_notes
      t.string :recording_format
      t.string :length
      t.string :drc_link
      t.string :language
      t.string :institution_repo
      t.string :institution_digital
      t.string :is_part_of
      t.string :series
      t.string :rights_uri
      t.string :rights
      t.string :subject
      t.string :subject_two
      t.string :subject_three
      t.string :title_alternitive
      t.string :title_text
      t.string :recording_type

      t.timestamps
    end
  end
end
