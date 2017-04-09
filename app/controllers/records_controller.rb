class RecordsController < ApplicationController

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
    @records = Record.all.paginate(:page => params[:page])
  end

  def show
    @record= Record.find(params[:id])
  end

  private

  def record_params
    params.require(:record).permit(:drc_id, :collection, :author, :location, :year, :date, :date_digitized, :date_issued, :description_html, :description_notes, :recording_format, :length, :drc_link, :language, :institution_repo, :institution_digital, :is_part_of, :series, :rights_uri, :rights, :subject, :subject_two, :subject_three, :title_alternitive, :title_text, :recording_type, :tracks)
  end
end
