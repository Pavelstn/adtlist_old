class ReviewMailer < ActionMailer::Base
  default from: "**************************"

  def welcome_email(phone, post_id, date)
    @phone = phone
    @post_id = post_id
    @date = date
    mail(:to => "***************", :subject => "*************")
  end

end
