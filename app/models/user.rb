class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, length: { in: 6..20 }, if: :password_required?

  has_many :created_events, class_name: "Event", foreign_key: "creator_id"

  protected

  def password_required?
    !persisted? || !password.nil? || !password_confirmation.nil?
  end
end
