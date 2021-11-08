class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event

  after_create :welcome_send

  def welcome_send
    AttendanceMailer.create(self).deliver_now
  end
end
