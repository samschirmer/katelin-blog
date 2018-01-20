class Post < ApplicationRecord
	before_create :set_slug

	def to_param
		"#{id}-#{title.parameterize}"
	end

	private
	
	def set_slug
		self.slug = title.parameterize
	end	

end
