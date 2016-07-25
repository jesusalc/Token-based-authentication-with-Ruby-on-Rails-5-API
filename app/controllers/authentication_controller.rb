# app/controllers/authentication_controller.rb
#
# Implementing helper methods into the controllers
# All the logic for handling JWT tokens has been laid
# down. It is time to implement it in the controllers
# and put it to actual use. The two most essential
# pieces to implement are identifying user log-in and
# referencing the current user.
#
# Logging in users
# First, let's start with the user's logging-in:
class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def authenticate
    command = AuthenticateUser.call(params[:email], params[:password])

    if command.success?
      render json: {auth_token: command.result}
    else
      render json: {error: command.errors}, status: :unauthorized
    end
  end

end
# The authenticate action will take the JSON
# parameters for e-mail and password through the
# params hash and pass them to the AuthenticateUser
# command.
#
# If the command succeeds, it will send the JWT token
# back to the user.
#
# Let's put a endpoint for the action:
#   config/routes.rb
# post 'authenticate', to: 'authentication#authenticate'




