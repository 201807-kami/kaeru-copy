class DiscSong < ApplicationRecord
	belongs_to :disc
	belongs_to :song
end
