class User < ApplicationRecord
    has_secure_password
    has_many :lineups  

    

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, confirmation: true
    validates :password, length: { in: 6..20 }
end
