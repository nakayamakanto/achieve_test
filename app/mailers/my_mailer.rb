class MyMailer < ApplicationMailer
    def sendmail_blog(blog)
      @blog = blog
    
      mail to: "warmouse4649@gmail.com",
             subject: '【Achieve】ブログが投稿されました'
    end

    def sendmail_contact(contact)
      @contact=contact

      mail to: @contact.email
            subject: 'お問い合わせありがとうございます'

    end
end
