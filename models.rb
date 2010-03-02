require 'rubygems'
require 'mongo_mapper'

MongoMapper.database="yatt-development"

class User
  include MongoMapper::Document

	key :username
	key :password
	key :password_salt
	key :email
	
	timestamps!
	
	validates_uniqueness_of :username
	
	before_create :encrypt_password	

	def encrypt_password
		self.password_salt = SHA1.hexdigest(Time.now.to_s)
		self.password = SHA1.hexdigest( self.password_salt + self.password)
	end
end

class Task
  #do some magic here
  include MongoMapper::Document

	key :title
	key :description
        key :tags
	key :start_time
	key :end_time
	key :is_completed
	key :deadline
        key :priority
	
	timestamps!

	#validates_uniqueness_of :title
end
