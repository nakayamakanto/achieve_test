class Blog < ActiveRecord::Base
    validates :title, presence: true
    
    has_many :comments, dependent: :delete_all
    belongs_to :user
end
