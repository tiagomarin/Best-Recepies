class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable, :confirmable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :foods, dependent: :destroy
  has_many :recipes, dependent: :destroy

  validates :email, format: URI::MailTo::EMAIL_REGEXP
  validates :name, presence: true, length: { in: 3..25 }
  validates :foods_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :recipes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.authenticate(email, password)
    user = User.find_for_authentication(email:)
    user&.valid_password?(password) ? user : nil
  end
end
