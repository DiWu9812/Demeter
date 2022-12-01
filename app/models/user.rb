class User < ActiveRecord::Base
    has_secure_password
    validates :username,  presence: true, length: { minimum:3, maximum: 20 }
    validates :password, presence: true, length: { minimum: 6 }
    validates :password_confirmation, presence: true, length: { minimum: 6 }
end
