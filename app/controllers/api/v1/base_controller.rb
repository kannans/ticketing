class Api::V1::BaseController < ActionController::Base
  include SymbolizeHelper

  private

  def json_response(object, status = :ok)
    render json: object, status: status
  end
end
