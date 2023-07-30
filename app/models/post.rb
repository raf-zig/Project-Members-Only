class Post < ApplicationRecord
  belongs_to :user
  validates :publication, presence: true 
end
