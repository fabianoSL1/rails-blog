class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy

  has_many :post_tags
  has_many :tags, through: :post_tags, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true

  paginates_per 3
end
