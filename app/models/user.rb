class User < ApplicationRecord

  has_many :comments
  has_many :orders

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	
  after_create { UserMailer.welcome(self).deliver_now } 

end
