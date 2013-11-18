class Api::V1::BaseController < ApplicationController
  before_filter :authenticate

  private

  def permission_denied
    render json: {error: 'unauthorized'}, status: :unauthorized
  end
end
