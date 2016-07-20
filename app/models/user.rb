class User < ActiveRecord::Base
   #mount avatar_uploader
   mount_uploader :avatar, AvatarUploader
   
   # Include default devise modules. Others available are:
   # :confirmable, :lockable, :timeoutable and :omniauthable
   devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable
          
   has_many :blogs
   
   def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
     #the pry here generated OAuth2::Error("type":"OAuthException","code":100) by  incorrectly initializing OmniAuth twice, calling config/initializers/omniauth.rb twice.
     # binding.pry
     user = User.where(provider: auth.provider, uid: auth.uid).first
     
     unless user
       user = User.new(
         name:     auth.extra.raw_info.name,
         provider: auth.provider,
         uid:      auth.uid,
         email:    auth.info.email ||= "#{auth.uid}-#{auth.provider}@example.com",
         image_url:   auth.info.image,
         password: Devise.friendly_token[0, 20]
       )
       # write user.skip_confirmation! before user.save 
       user.skip_confirmation!
       user.save(validate: false)
     end
     user
   end
   
   def self.create_unique_string
     SecureRandom.uuid
   end
end