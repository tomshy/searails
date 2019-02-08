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
	def edit(blogBody)
		@blogBody=blogBody
		@@articles[@id].update(body:@blogBody)
	end
	def delete(blogId)
		@blogId=blogId
		@@articles.delete(@id)
	end
end

class Comment
	attr_accessor :commentBody
	@@comments=Hash.new { |hash, key| hash[key] = {} }	
	def initialize(articleId,commentBody)
		@articleId=articleId
		@commentBody=commentBody
		@@comments[@articleId][:commentBody]=commentBody					
	end
	def commentBody
		return @commentBody
	end
	def Comment.all
		return @@comments
	end

end
