class Api::V1::Users::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token, only: [:create]
  # Not sure I need this.. when up and running remove.
  respond_to :json

  private

  def respond_with(resource, _opts={})
    render json: {message: 'You are now logged in.'}, status: :ok
  end

  def respond_to_on_destroy
    log_out_success && return if current_user
    log_out_failure
  end

  def log_out_success
    render json: {message: 'You are now logged out.'}, status: :ok
  end

  def log_out_failure
    render json: {message: 'That didn`t seem to work.'}, status: :unauthorized
  end
end
