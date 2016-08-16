class User < ActiveRecord::Base
   #mount avatar_uploader
   mount_uploader :avatar, AvatarUploader
   
   # Include default devise modules. Others available are:
   # :confirmable, :lockable, :timeoutable and :omniauthable
   devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable
          
   has_many :blogs, dependent: :destroy
   has_many :comments, dependent: :destroy
   has_many :relationships, foreign_key: "follower_id", dependent: :destroy
   has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
   has_many :followed_users, through: :relationships, source: :followed
   has_many :followers, through: :reverse_relationships, source: :follower
   has_many :tasks, dependent: :destroy
   has_many :submit_requests, dependent: :destroy
   
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
   
   def self.find_for_twitter_oauth(auth, signed_in_resource = nil)
      user = User.where(provider: auth.provider, uid: auth.uid).first
      unless user
         user = User.new(
             name:     auth.info.nickname,
             image_url: auth.info.image,
             provider: auth.provider,
             uid:      auth.uid,
             email:    auth.info.email ||= "#{auth.uid}-#{auth.provider}@example.com",
             password: Devise.friendly_token[0, 20],
         )
         user.skip_confirmation!
         user.save
      end
      user
   end
   
   #自分がフォローしているユーザーを取得する
   # def who_follow?(user)
   #    @relationships=Relationships.where()
   # end
   
   #指定のユーザをフォローする
   def follow!(other_user)
     relationships.create!(followed_id: other_user.id)
   end
   
   #指定のユーザーのフォローをやめる
   def unfollow!(other_user)
     relationships.find_by(followed_id: other_user.id).destroy
   end
   
   #フォローしているかどうかを確認する
   def following?(other_user)
     relationships.find_by(followed_id: other_user.id)
   end
   
   def self.create_unique_string
     SecureRandom.uuid
   end
   
   def friend
      followers & followed_users
   end
end