class User < ApplicationRecord
	
	mount_uploader :avatar, AvatarUploader
	has_many :authentications, :dependent => :destroy

    has_secure_password
    
	validates_presence_of :email
    validates_presence_of :password
    validate :valid_password, :valid_email
    before_create :valid_password, :valid_email
	
	has_many :posts, dependent: :destroy
	has_many :comments
	has_many :likes
    
	enum gender: [:not_specified, :male, :female]

    def valid_password
		unless self.password.length >= 6
			errors.add(:password, "length is too short.")
		end
	end
	
	def valid_email
		unless self.email =~ /\w+@\w+\.\w{2,}/
			errors.add(:email, "is not valid.")
		end
	end

	def self.create_with_auth_and_hash(authentication, auth_hash)
      	create! do |user|
			user.fullname = auth_hash["extra"]["raw_info"]["name"]
      		user.email = auth_hash["extra"]["raw_info"]["email"]
      		user.authentications << (authentication)
			user.password = SecureRandom.hex(7)       
		end
	end

  	def fb_token
    	x = self.authentications.where(:provider => :facebook).first
    	return x.token unless x.nil?
  	end
end
