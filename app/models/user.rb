class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :articles, :dependent => :destroy
  has_many :comments, :dependent => :destroy
end
