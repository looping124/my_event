class User < ApplicationRecord
  has_many :created_events, class_name: "Event"
  has_many :attendances
  has_many :events, through: :attendances

  after_create :welcome_send

  def welcome_send
    UserMailer.create(self).deliver_now
  end
end
