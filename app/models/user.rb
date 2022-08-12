class User < ApplicationRecord
  has_many :appointments, dependent: :destroy
  validates :name, presence: true, length: { minimum: 3, maximum: 15 }
end
