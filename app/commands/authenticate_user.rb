# app/commands/authenticate_user.rb
# The command takes the parameters and initializes
# a class instance with email and password attributes
# that are accessible within the class. The private
# method user uses the credentials to check if the user
# exists in the database using User.find_by_email .
#
# If the user is found, the method uses the built-in
# authenticate method (available by putting has_secure_password
# in the User model to check if the user's password is
# correct. If everything is true, the user will be
# returned. If not, the method will return nil.
class AuthenticateUser
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  attr_accessor :email, :password

  def user
    user = User.find_by_email(email)
    return user if user && user.authenticate(password)

    errors.add :user_authentication, 'invalid credentials'
    nil
  end
end
