Model
class Post < ApplicationRecord
	validates :title, presence: true
	validates :content, presence: true
end

Controller
class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@posts = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to @post
		else
			render :new
		end
	end
	
	def post_params
		params.require(:post).permit(:title, :content)

	end
end

<%
View

<!-- app/views/posts/index.html.erb -->
<h1>Blog Posts</h1>
<% @posts.each do |post| %>
  <h2><%= link_to post.title, post_path(post) %></h2>
  <p><%= post.content.truncate(100) %></p>
<% end %> 
 %> 


Model

#create a migration
rails generate migration CreatePosts title: string content:text

#using active record console 

posts = Posts.create(title: "Hello World", content: "This is my first post")

Controller

#config/routs.rb

#handling requests in controller
def update
	@post = Post.find(params[:id])
		if @post.update(post_params)
			redirect_to @post
		else
			render :edit
		end
	end

View

<!-- app/views/posts/show.html.erb -->
<h1><%= @post.title %></h1>
<p><%= @post.content %></p>

Implement authentication and authorization 

gem 'devise'

rails generate devise:install
rails generate devise User

