class User < ApplicationRecord
has_many :holes
has_many :matches, through: :holes
validates :username, uniqueness: true
end
