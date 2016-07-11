module Messaging
  def get_messages(page_number)
    response = self.class.get("https://www.bloc.io/api/v1/message_threads", body: { page: page_number }, headers: { "authorization" => @authorization_token} )
    @message_page = JSON.parse(response.body, symbolize_names: true)
  end

  def create_message(user_id, recipient_id, subject, stripped_text)
    self.class.post("https://www.bloc.io/api/v1/messages", body: { user_id: user_id, recipient_id: recipient_id, subject: subject, "stripped-text": stripped_text }, headers: { "authorization" => @authorization_token} )
  end
end