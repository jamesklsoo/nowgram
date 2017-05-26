class User < ApplicationRecord
    has_secure_password
    validates_presence_of :email
    validates_presence_of :password
    validate :valid_password, :valid_email
    before_create :valid_password, :valid_email

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
end
