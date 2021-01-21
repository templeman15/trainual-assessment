class User < ApplicationRecord
  validates :name, :email, :phone, :status, presence: true
  validates :email, uniqueness: true

  enum status: %w[active inactive]
end
