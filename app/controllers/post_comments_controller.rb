class PostCommentsController < ApplicationController

	def create
		book = Book.find(params[:book_id])
		post_comment = current_user.post_comments.new(post_comment_params)
		post_comment.book_id = book.id
		post_comment.save
		redirect_to book_path(book.id), notice: "The comment was successfully submitted"
	end

	def edit
		@post_comment = PostComment.find(params[:id])
		@book_new = Book.new
		unless current_user == @post_comment.user
			redirect_to book_path(@post_comment)
		end
	end

	def update
		post_comment = PostComment.find(params[:id])
		if current_user == post_comment.user
			post_comment.update(post_comment_params)
			redirect_to book_path(post_comment.book), notice: "The comment was successfully updated"
		else
			redirect_to book_path(post_comment.book)
		end
	end

	def destroy
		post_comment = PostComment.find(params[:id])
		if current_user == post_comment.user
			post_comment.destroy
			redirect_to book_path(params[:book_id]), notice: "The comment was successfully destroyed"
		else
			redierect_to book_path(post_comment.book)
		end
	end

	private

	def post_comment_params
		params.require(:post_comment).permit(:user_id, :book_id, :comment)
	end

end
