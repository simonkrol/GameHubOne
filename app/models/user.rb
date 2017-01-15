class User < ApplicationRecord
	before_save { self.email=email.downcase }
	validates :name, presence: { message: "Name is required" }
	validates :password, presence: { message: "Password is required" }
	validates :password, length: {minimum:7, message: "Password must be 7 or more characters" }
	validates :email, uniqueness: { case_sensitive: false, message: "Email already in use" }
 	validates :password, confirmation: { message: "Passwords don't match" }
 	validates :password_confirmation, presence: { message: "Password confirmation is required" }

 	#has_secure_password
 	cattr_accessor :password, :password_confirmation


	# def initialize(attributes = {})
	# 	@name = attributes[:name]
	# 	@address = attributes[:address]
	# 	@email = attributes[:email]
	# 	@password = attributes[:password]
	# end
end


