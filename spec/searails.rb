class Blog
	@@articles = Hash.new { |hash, key| hash[key] =  {}}
	attr_accessor :id
	def initialize(id,title,body)
		@id=id
		@title=title
		@body=body
		@@articles[@id][:body]=body
	end
	def id
		return @id
	end
	def Blog.all
		return @@articles
	end
	def edit(blog_body)
		@blog_body=blog_body
		@@articles[@id].update(body:@blog_body)
	end
end

class Comment
	attr_accessor :commentBody
	@@comments=Hash.new { |hash, key| hash[key] = {} }	
	def initialize(article_id,comment_body)
		@article_id=article_id
		@comment_body=comment_body
		@@comments[@article_id][:comment_body]=comment_body					
	end
	def comment_body
		return @comment_body
	end
	def Comment.all
		return @@comments
	end

end