class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :timeoutable, :trackable, :confirmable

  has_many :memberships
  has_many :spaces, through: :memberships
  accepts_nested_attributes_for :memberships

  def admin?
    ENV['ADMIN_EMAILS'].include?(self.email)
  end
end
