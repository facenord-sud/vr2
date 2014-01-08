class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  extend Enumerize

  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable, :registerable

   #attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :role

  enumerize :role, in: [:admin, :writer], predicates: true

  has_many :events
  has_many :posts

  validates :name, presence: true

  def to_s
    name
  end

end
