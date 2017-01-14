class User < ApplicationRecord
	attr_accessor :name, :address, :email, :password

	def initialize(attributes = {})
		@name = attributes[:name]
		@address = attributes[:address]
		@email = attributes[:email]
		@password = attributes[:password]
		@salt = attributes[:salt]
end
