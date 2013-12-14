class Comment < ActiveRecord::Base
  attr_accessible :body, :is_spam, :id, :pin_id
  validates :body, length: { minimum: 2 }
  belongs_to :user
  validates :user_id, presence: true
  belongs_to :pin
  validates :pin_id, presence: true
end
