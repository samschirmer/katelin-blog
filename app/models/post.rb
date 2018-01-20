class Post < ApplicationRecord
	before_create :set_slug

	def self.index
		# TODO account for published status
		@posts = Post.find_by_sql("SELECT p.id, p.created_at, p.title, p.body, count(c.id) AS num_comments FROM posts AS p LEFT JOIN comments AS c ON c.post_id = p.id GROUP BY p.id, p.created_at, p.title, p.body ORDER BY p.created_at DESC")
	end

	def to_param
		"#{id}-#{title.parameterize}"
	end

	private
	
	def set_slug
		self.slug = title.parameterize
	end	

end
