class Post < ApplicationRecord
	before_create :set_slug

	def self.index
		@posts = Post.find_by_sql("SELECT p.id, p.created_at, p.title, p.body, IFNULL(c.count,0) AS num_comments, IFNULL(c2.count,0) AS num_ua FROM posts AS p LEFT JOIN (SELECT count(*) AS count, post_id FROM comments WHERE IFNULL(deleted, 0) = 0 AND IFNULL(approval, 0) = 1) AS c ON c.post_id = p.id LEFT JOIN (SELECT count(*) AS count, post_id FROM comments WHERE IFNULL(deleted,0) = 0 AND IFNULL(approval,0) = 0) AS c2 ON c2.post_id = p.id GROUP BY p.id, p.created_at, p.title, p.body ORDER BY p.created_at DESC")
	end

	def to_param
		"#{id}-#{title.parameterize}"
	end

	private
	
	def set_slug
		self.slug = title.parameterize
	end	

end
