# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

csv = File.path(Rails.root.join('lib', 'seeds', 'updated-elliston-data.csv'))

CSV.foreach(csv, headers: true, :encoding => 'ISO-8859-1:UTF-8') do |row|
  Record.create(
    :drc_id => row['id'],
    :collection => row['collection'],
    :author => row['dc.contributor.author'],
    :location => row['dc.coverage.spatial'],
    :year => row['dc.coverage.spatial[en_US]'],
    :date => row['dc.date.created'],
    :date_digitized => row['dc.date.digitized'],
    :date_issued => row['dc.date.issued'],
    :description_html => row['dc.description'],
    :description_notes => row['dc.description.notes'],
    :recording_format => row['dc.description.notes[en_US]'],
    :length => row['dc.description[en_US]'],
    :drc_link => row['dc.format.extent'],
    :language => row['dc.language.iso'],
    :institution_repo => row['dc.publisher.OLinstitution[en_US]'],
    :institution_digital => row['ddc.publisher.digital'],
    :is_part_of => row['dc.relation.ispartof'],
    :series => row['dc.relation.ispartofseries'],
    :rights_uri => row['dc.rights.uri[*]'],
    :rights => row['dc.rights[*]'],
    :subject => row['dc.subject'],
    :subject_two => row['dc.subject.lcsh'],
    :subject_three => row['dc.subject.lcsh[en_US]'],
    :title_alternitive => row['dc.subject[en_US]'],
    :title_text => row['dc.title[en_US]'],
    :recording_type => row['dc.type']
    )
end
