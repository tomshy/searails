
require "minitest/autorun"

class TestBlogApp < Minitest::Test
  def setup
    @blog = Blog.new(name: 'The best Blog')
  end

  def test_new_blog
    refute_nil @blog.id, 'id is initialized automatically'
    refute_nil @blog.name
    assert_equal @blog.articles, [] 
    @blog.name = 'New Name'
    assert_equal @blog.name, 'New Name', 'Can edit field'
    assert_raises NoMethodError, 'id cannot be assigned' do
      @blog.id = SecureRandom.uuid
    end   
  end
  
  def test_new_article
    title = 'Arcticle 1'
    body = 'Article 1 body'
    article_1 = @blog.new_article(title: title, body: body)
    refute_nil article_1.id, 'id is initialized automatically'
    refute_nil article_1.title
    refute_nil article_1.body
    assert_equal article_1.comments, []
    article_1.title = 'New Title'
    assert_equal article_1.title, 'New Title', 'Can edit field'
    article_1.body = 'New Body'
    assert_equal article_1.body, 'New Body', 'Can edit field'
    assert_raises NoMethodError, 'id cannot be assigned' do
      article_1.id = SecureRandom.uuid
    end
  end

  def test_articles_array
    2.times do
      @blog.new_article(title:'Article', body: 'Article body')
    end
    assert_equal @blog.articles.size, 2
  end
end
