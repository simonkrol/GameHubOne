class User < ApplicationRecord
	#has_many :rooms
	has_secure_password
	before_save { self.email=email.downcase }
	validates :name, presence: { message: " is required" }
	validates :email, uniqueness: { case_sensitive: false, message: "already in use" } 
	validates :username, presence: { message: " is required" }
 	attr_accessor :remember_token
 	

 	validates :password, presence: true, length: { minimum: 7 }, allow_nil: true
 	#attr_accessor :password, :password_confirmation


	# def initialize(attributes = {})
	# 	@name = attributes[:name]
	# 	@address = attributes[:address]
	# 	@email = attributes[:email]
	# 	@password = attributes[:password]
	# end
	class << self
		def digest(string)
			cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
			BCrypt::Password.create(string, cost: cost)
		end

		def new_token
			SecureRandom.urlsafe_base64
		end
	end
	def remember 
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(remember_token))
	end

	def authenticated?(remember_token)
		return false if remember_digest.nil?
		BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end

	def forget
		update_attribute(:remember_digest, nil)
	end
end


