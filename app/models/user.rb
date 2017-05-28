class User < ApplicationRecord
	
	mount_uploader :avatar, AvatarUploader
	has_many :authentications, :dependent => :destroy

    has_secure_password
    
	validates_presence_of :email
    validates_presence_of :password
    validate :valid_password, :valid_email
    before_create :valid_password, :valid_email
	
	has_many :posts, dependent: :destroy
    
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
      	user = User.create!(name: auth_hash["name"], email: auth_hash["extra"]["raw_info"]["email"])
      	user.authentications << (authentication)      
		return user
  	end

  	def fb_token
    	x = self.authentications.where(:provider => :facebook).first
    	return x.token unless x.nil?
  	end
end
