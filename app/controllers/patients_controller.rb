class PatientsController < ApplicationController
  def imc
    render json: ImcHandler.execute(params)
  end
end
