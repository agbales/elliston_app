class Api::RecordsController < ApplicationController
  def show
    @record= Record.find(params[:id])
  end

  private
end
