class Post < ActiveRecord::Base
	# create some validations here that ensure both our attributes
	# are present when a user creates or edits a post
	validates :bru_name, presence: true
end
