class MyMailer < ApplicationMailer
    def sendmail_blog(blog)
        @blog = blog
    
        mail to: "warmouse4649@gmail.com",
             subject: '【Achieve】ブログが投稿されました'
    end
end
