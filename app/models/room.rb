class Room < ApplicationRecord
	has_many :roomusers 
	has_one :roomowner
	has_many :users, through: :roomusers
	has_one :user, through: :roomowner
end
