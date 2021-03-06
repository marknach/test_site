class User < ActiveRecord::Base 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include Gravtastic
  gravtastic :size => 512
         
  has_many :posts
  has_many :summoners
  accepts_nested_attributes_for :summoners

  def is_admin?
    return admin
  end

  def to_s
    self.name.presence || self.email
  end
end
