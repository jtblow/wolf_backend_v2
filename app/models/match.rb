class Match < ApplicationRecord
has_many :holes
has_many :users, through: :holes
end
