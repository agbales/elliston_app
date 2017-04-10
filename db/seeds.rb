require 'csv'
require 'Nokogiri'

csv = File.path(Rails.root.join('lib', 'seeds', 'updated-elliston-data.csv'))

CSV.foreach(csv, headers: true, :encoding => 'ISO-8859-1:UTF-8') do |row|

  # Create track listings
  html = row['dc.description']
  if html
    html.gsub!('&nbsp;', ' ')
  end

  doc = Nokogiri::HTML(html)
  urls = Hash[doc.xpath('//a[@href]').map {|link| [link.next_sibling.text.strip, link["href"]]}]
  tracks = []
  urls.each_with_index do |(key,value), index|
    track = {
      track_num: index,
      title: key,
      mp3: value
    }
    tracks << track
  end

  # Format Author Names
  authors = row['dc.contributor.author'].gsub(/[0-9]|-|\|/, ' ').split(' ')
  formatted_author_names = []
  authors.each_with_index do |w, i|
    if w.include?(',')
      first_name = authors[i+1].to_s
      if first_name.include?('.')
        if authors[i+2].include?('.')
          first_name += authors[i+2]
        end
      end
      if authors[i+1]
        last_name = w.gsub!(',', '')
        formatted_author_names << first_name.to_s.gsub(',', '') + ' ' + last_name
      end
    end
  end
  formatted_author_names = formatted_author_names.join(' & ')

  Record.create(
    :drc_id => row['id'],
    :collection => row['collection'],
    :author => formatted_author_names,
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
    :recording_type => row['dc.type'],
    :tracks => tracks
    )
end
