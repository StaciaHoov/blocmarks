class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :topics
  has_many :bookmarks
  has_many :likes, dependent: :destroy
  
  def liked(bookmark)
    likes.where(bookmark_id: bookmark.id).first 
  end
  
  def liked_bookmarks
    self.likes.includes(bookmark: :topic).map(&:bookmark)
  end
end
