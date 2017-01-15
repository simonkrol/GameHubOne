class User < ApplicationRecord
	before_save { self.email=email.downcase }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :name, presence: { message: "Name is required" }
	validates :password, presence: { message: "Password is required" }
	validates :password, length: {minimum:7, message: "Password must be 7 or more characters" }
	validates :email, uniqueness: { case_sensitive: false, message: "Email already in use" }
 	validates :email, format: { with: VALID_EMAIL_REGEX } message: "Invalid Email"
 	validates :password, confirmation: { message: "Passwords don't match" }
 	validates :password_confirmation, presence: { message: "Password confirmation is required" }

 	has_secure_password
 	cattr_accessor :encrypted_pass, :salt, :encrypted_pass_confirmation


	def initialize(attributes = {})
		@name = attributes[:name]
		@address = attributes[:address]
		@email = attributes[:email]
		@password = attributes[:password]
		@salt = attributes[:salt]
	end
end


