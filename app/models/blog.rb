class Blog < ActiveRecord::Base
    validates :title, presence: true
    
    has_many :comments, dpendent: :delete_all
    belongs_to :user
end
