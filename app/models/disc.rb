class Disc < ApplicationRecord
	belongs_to :item
	has_many :disc_songs
	has_many :songs, through: :disc_songs
	accepts_nested_attributes_for :songs, allow_destroy: true
end
