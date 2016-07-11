require 'httparty'

class Kele
  include HTTParty

  def initialize(email, password)
    response = self.class.post("https://www.bloc.io/api/v1/sessions", body: { "email": email, "password": password })
    puts "Email/password combination not found. Please try again." if response.code != 200
    @authorization_token = response["auth_token"]
  end

  def get_me
    response = self.class.get("https://www.bloc.io/api/v1/users/me", headers: { "authorization" => @authorization_token} )
    @student_data = JSON.parse(response.body, symbolize_names: true)
  end
end