class ContactMailer < ApplicationMailer
  def contact_mail(post)
    @post = post
    mail to: "u.yuya0616ll@gmail.com", subject: "投稿確認メール"
  end
end
