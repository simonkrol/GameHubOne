class Room < ApplicationRecord
	#belongs_to :user
	has_and_belongs_to_many :users
	has_one :owner
end
