class User < ApplicationRecord
  has_person_name
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews  

  has_many :events

  has_many :notifications, foreign_key: :recipient_id
  
  
  def likes?(book)
    book.likes.where(user_id: id).any?
  end

  def avatar_url
     hash = Digest::MD5.hexdigest(email)
    "http://www.gravatar.com/avatar/#{hash}"
  end
       
end
