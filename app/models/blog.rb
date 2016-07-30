class Blog < ActiveRecord::Base
    validates :title, presence: true
    
    has_many :comments, dpendenct: :delete_all
    belongs_to :user
end
