class Person < ApplicationRecord
  has_many :assignments
  has_many :teams, through: :assignments
end
