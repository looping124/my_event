class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :created_events, class_name: "Event"
  has_many :attendances
  has_many :events, through: :attendances

  after_create :welcome_send

  def welcome_send
    UserMailer.create(self).deliver_now
  end
end
