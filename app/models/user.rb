class User < ApplicationRecord
	#cattr_accessor :password, :password_confirmation
	has_secure_password
	before_save { self.email=email.downcase }
	validates :name, presence: { message: " is required" }
	validates :password, length: {minimum:7, message: "must be 7 or more characters" }
	validates :email, uniqueness: { case_sensitive: false, message: "already in use" }
 	validates :password_confirmation, presence: { message: "can't be blank" }

 	
 	#attr_accessor :password, :password_confirmation


	# def initialize(attributes = {})
	# 	@name = attributes[:name]
	# 	@address = attributes[:address]
	# 	@email = attributes[:email]
	# 	@password = attributes[:password]
	# end
end


