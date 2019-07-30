class User < ApplicationRecord

has_many :holes
has_many :matches, through: :holes
has_secure_password
validates :username, uniqueness: {case_sensitive: false}
end
