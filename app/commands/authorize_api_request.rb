# app/commands/authorize_api_request.rb
#
# Checking user authorization
#
# The token creation is done, but there is no way to check
# if a token that's been appended to a request is valid.
# The command for authorization has to take the headers
# of the request and decode the token using the decode
# method in the JsonWebToken singleton.
#
# A refresher on headers Http requests have fields
# known as headers . Headers can contain a wide variety
# of information about the request that can be helpful
# for the server to interpret it. For example, a header
# can contain the format of the request body,
# authorization information and other meta information
# (you can find all the types here ). Tokens are usually
# attached to the 'Authorization' header.
#
# Here is how the code is structured:
class AuthorizeApiRequest
  prepend SimpleCommand

  def initialize(headers = {})
    @headers = headers
  end

  def call
    user
  end

  private
  attr_reader :headers

  def user
    @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
    @user || errors.add(:token, 'Invalid token') && nil
  end

  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  def http_auth_header
    if headers['Authorization'].present?
      return headers['Authorization'].split(' ').last
    else
      errors.add(:token, 'Missing token')
    end
    nil
  end

end
# This code executes a chain of methods. Let's go from
# bottom to top.
#
# The last method in the chain, http_auth_header,
# extracts the token from the authorization header
# received in the initialization of the class. The
# second method in the chain is decoded_auth_token,
# which decodes the token received from http_auth_headerand
# retrieves the user's ID.
#
# The logic in the user method might seem abstract,
# so let's go through it line by line.
#
# In the first line, the ||= operator is used to
# assign @user by assigning "if not nil". Basically,
# if the User.find() returns an empty set
# or decoded_auth_token returns false, @user will
# be nil.
#
# Moving to the second line, the user method will
# either return the user or throw an error. In
# Ruby, the last line of the function is
# implicitly returned, so the command ends up
# returning the user object.


