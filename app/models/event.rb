class Event < ApplicationRecord
  validates :name, presence: true
  validates :date, presence: true
  validates :time, presence: true

  belongs_to :creator, class_name: "User"
  has_many :invites, foreign_key: "attended_event_id"
  has_many :attendees, through: :invites, source: :users, foreign_key: "attendee_id"

  scope :past, -> { where("date < ?", Date.today) }
  scope :upcoming, -> { where("date > ?", Date.today) }
end
