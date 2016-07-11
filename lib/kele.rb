require 'httparty'
require './lib/roadmap.rb'
require './lib/messaging.rb'

class Kele
  include HTTParty
  include Roadmap
  include Messaging

  def initialize(email, password)
    response = self.class.post("https://www.bloc.io/api/v1/sessions", body: { "email": email, "password": password })
    puts "Email/password combination not found. Please try again." if response.code != 200
    @authorization_token = response["auth_token"]
  end

  def get_me
    response = self.class.get("https://www.bloc.io/api/v1/users/me", headers: { "authorization" => @authorization_token} )
    @student_data = JSON.parse(response.body, symbolize_names: true)
  end

  def get_mentor_availability(mentor_id)
    response = self.class.get("https://www.bloc.io/api/v1/mentors/#{mentor_id}/student_availability", headers: { "authorization" => @authorization_token} )
      @get_mentor_availability = JSON.parse(response.body, symbolize_names: true)
  end
end