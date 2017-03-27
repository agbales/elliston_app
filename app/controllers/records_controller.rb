class RecordsController < ApplicationController

  # def initialize(drc_id, collection, author, location, year, date, date_digitized, date_issued, description_html, description_notes, recording_format, length, drc_link, language, institution_repo, institution_digital, is_part_of, series, rights_uri, rights, subject, subject_two, subject_three, title_alternitive, title_text, recording_type, tracks)
  #   @drc_id = drc_id
  #   @collection = collection
  #   @author = author
  #   @location = location
  #   @year = year
  #   @date = date
  #   @date_digitized = date_digitized
  #   @date_issued = date_issued
  #   @description_html = description_html
  #   @description_notes = description_notes
  #   @recording_format = recording_format
  #   @length = length
  #   @drc_link = drc_link
  #   @language = language
  #   @institution_repo = institution_repo
  #   @institution_digital = institution_digital
  #   @is_part_of = is_part_of
  #   @series = series
  #   @rights_uri = rights_uri
  #   @rights = rights
  #   @subject = subject
  #   @subject_two = subject_two
  #   @subject_three = subject_three
  #   @title_alternitive = title_alternitive
  #   @title_text = title_text
  #   @recording_type = recording_type
  #   @tracks = tracks
  # end

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    if @record.save
      puts 'saved'
    else
      puts 'not saved'
    end
  end

  def index
    @records = Record.all
  end

  def show
    @record= Record.find(params[:id])
  end

  private

  def record_params
    params.require(:record).permit(:drc_id, :collection, :author, :location, :year, :date, :date_digitized, :date_issued, :description_html, :description_notes, :recording_format, :length, :drc_link, :language, :institution_repo, :institution_digital, :is_part_of, :series, :rights_uri, :rights, :subject, :subject_two, :subject_three, :title_alternitive, :title_text, :recording_type, :tracks)
  end
end
