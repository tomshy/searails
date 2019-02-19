
class Blog
  attr_accessor :name
  attr_reader :id, :articles
  def initialize(name)
    @name = name
    @id=SecureRandom.uuid
    @articles = []
  end
  def new_article(title:nil, body:nil)
    article=Article.new(title, body)
    @articles.push(article)
    return article
  end
end

class Article
  attr_accessor :title, :body
  attr_reader :id, :comments
  
  def initialize(title, body)
    @title = title
    @body = body
    @id=SecureRandom.uuid
    @comments=[]
  end
  def new_comment(body:nil)
    comment=Comment.new(body)
    @comments.push(comment)
  end 
end

class Comment
  attr_accessor :body
  def initialize(body)
    @body=body    
  end
end