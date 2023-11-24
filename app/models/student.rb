class Student < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :contactno, presence: true, numericality: { only_integer: true }
end
