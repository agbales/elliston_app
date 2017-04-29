# json.extract! @record, :id, :author, :date, :tracks
json.merge! @record.attributes.except("description_html")
