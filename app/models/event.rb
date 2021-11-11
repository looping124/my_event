class Event < ApplicationRecord
  belongs_to :user
  has_many :attendances
  has_many :users, through: :attendances
  validates :start_date, presence: true
  validate :date_is_not_passed
  validates :duration, presence: true
  validate :duration_is_positive_and_multiple_of_five
  validates :title, presence: true , length: {minimum: 5, maximum: 140}
  validates :description, presence: true , length: {minimum: 20, maximum: 140}
  validates :price, presence: true, inclusion: { in: 1..1000, message: 'The price must be between 1 and 1000' }
  validates :location, presence: true
  has_one_attached :avatar
end

def date_is_not_passed
  if start_date < Time.now
    errors.add(:start_date, "can't be in the past")
  end
end

def duration_is_positive_and_multiple_of_five
  unless  duration == nil
    if duration < 0
      errors.add(:duration, "can't be negative")
    elsif duration % 5 != 0
      errors.add(:duration, "should be a multiple of five")
    end
  end
end