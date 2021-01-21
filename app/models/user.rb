class User < ApplicationRecord
  validates :name, :email, :phone, :status, presence: true
  validates :email, uniqueness: true

  enum status: %w[active inactive]

  ransack_alias :search, :name_or_email_or_phone
end
