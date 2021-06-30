class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :timeoutable, :trackable, :confirmable

  has_and_belongs_to_many :spaces
  accepts_nested_attributes_for :spaces

  def admin?
    ENV['ADMIN_EMAILS'].include?(self.email)
  end
end
