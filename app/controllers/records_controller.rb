class RecordsController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    if params[:query]
      @records = Record.where("series LIKE ?", "%#{params[:query]}%").paginate(:page => params[:page])
    else
      @records = Record.order(sort_column + " " + sort_direction).paginate(:page => params[:page])
    end
  end

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

  def show
    @record= Record.find(params[:id])
  end

  private

  def record_params
    params.require(:record).permit(:drc_id, :collection, :author, :location, :year, :date, :date_digitized, :date_issued, :description_html, :description_notes, :recording_format, :length, :drc_link, :language, :institution_repo, :institution_digital, :is_part_of, :series, :rights_uri, :rights, :subject, :subject_two, :subject_three, :title_alternitive, :title_text, :recording_type, :tracks)
  end

  def sort_column
    params[:sort] || "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
