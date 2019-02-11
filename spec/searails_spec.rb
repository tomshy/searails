require 'rspec'
require_relative 'searails.rb'

describe Blog do
	describe '#initialize' do
		it "returns instance of a blog" do			
		expect(Blog.new(1,"title 1","body 1")).to be_instance_of Blog
		end
	end
	
	describe '#id' do
		it "should return the id of the blogs" do
			blog=Blog.new(1,"title 1","body 1")		
			expect(blog.id).to eq 1
		end
	end
	describe '#Blog.all' do
		it "should return all instantiated blogs" do
			@@articles=Hash.new { |hash, key| hash[key] = {} }
			blog=Blog.new(1,"title 1","body 1")			
			expect(@@articles.length).to eq 1
		end
	end
	describe '#edit' do
		it "edits a created blog" do
			blog=Blog.new(1,"title 1","body 1")
			expect(blog.edit("body 2")).to include(:body=>"body 2")
		end
	end 
end
describe Comment do
	describe '#initialize' do
		it 'should instanstiate a Comment object' do
			expect(Comment.new('1','Comment 1')).to be_instance_of Comment
		end
	end
	describe '#comment_body' do
		it "should add a comment to the blog" do
			comment=Comment.new('1','commenct 1')
			expect(comment.comment_body).to eq('commenct 1')
		end
	end
	describe '#Comment.all' do

		it "returns all the comments" do			
			@@comments=Hash.new { |hash, key| hash[key] = {} }
			comment=Comment.new('1','commenct 1')
			comment2=Comment.new('2','commenct 2')
			expect(@@comments.length).to eq 2
		end
	end
end
