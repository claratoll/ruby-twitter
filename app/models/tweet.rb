class Tweet < ApplicationRecord
  validates :body, presence: true, length: { maximum: 280 }

  belongs_to :user
end
