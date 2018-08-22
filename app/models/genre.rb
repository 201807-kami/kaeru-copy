class Genre < ApplicationRecord
	has_many :items#, optional: true
end
