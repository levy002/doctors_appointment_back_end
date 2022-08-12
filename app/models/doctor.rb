class Doctor < ApplicationRecord
  has_many :appointments, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3, maximum: 15}
  validates :image, presence: true
  validates :details, presence: true, length: { minimum: 3, maximum: 300}
  validates :fee, presence: true, numericality: { greater_than: 10, less_than: 100_000 }
end
