class Post < ActiveRecord::Base
  attr_accessible :content, :title
  belongs_to :user
  has_many :images, :dependent => :destroy

  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true

  default_scope order: 'posts.created_at DESC'
end
