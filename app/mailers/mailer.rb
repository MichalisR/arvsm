class Mailer < ApplicationMailer

  def mail_request(request)
    @request=request
    mail(to: request.approver.email,
         subject: "#{request.user.name} made a new request")
  end

  def mail_status(request)
    @request=request
    mail(to: request.user.email,
         subject: "#{request.user.name} your request has been #{t "request_status.#{request.status}"}")
  end
end
