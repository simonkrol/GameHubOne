class Roomowner < ApplicationRecord
	belongs_to :rooms
	belongs_to :users
end