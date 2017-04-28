class Api::RecordsController < ApplicationController
  before_action :set_default_format

  def show
    @record= Record.find(params[:id])
  end

  private

  def set_default_format
    request.format = :json
  end
end
