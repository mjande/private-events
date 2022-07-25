class Event < ApplicationRecord
  validates :name, presence: true
  validates :date, presence: true
  validates :time, presence: true

  belongs_to :creator, class_name: "User"
end
