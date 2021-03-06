class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  def authenticate?
    if invalid_request?
      render json: { error: 'invalid request'}, status: 401
    end
    true
  end

  def entry_room?
    if Entry.where(user_id: current_api_v1_user, room_id: params[:room_id]).blank?
      return render json: { error: 'invalid request'}, status: 401
    end
    true
  end

  private

  def invalid_request?
    request_headers = DeviceRequestHeaders.new(request)
    return true if request_headers.invalid?

    user = User.find_by_uid(request_headers.headers["uid"])
    return true unless user.valid_token?(request_headers.headers["access-token"], request_headers.headers["client"])

    false
  end
end
