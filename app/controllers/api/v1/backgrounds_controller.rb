class Api::V1::BackgroundsController < ApplicationController
  def index
    response = BackgroundFacade.image(params[:location])
    render json: BackgroundsSerializer.new(response)
  end
end
