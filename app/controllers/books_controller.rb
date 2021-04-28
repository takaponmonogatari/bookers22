class BooksController < ApplicationController

 def create
  @book = Book.new(book_params)
  @book.user_id = current_user.id
  if @book.save
   redirect_to books_path(@book.id)
   flash[:notice] = "You have created book succesfully."
  else
   @books = Book.all
   @user = current_user
   render :index
   flash[:alert]
  end
 end

 def index
  @book = Book.new
  @books = Book.all
  @user = current_user
 end

 def show
  @books = Book.all
  
 end

 def edit
 end

 def update
 end

 def destroy
 end

 private

 def book_params
  params.require(:book).permit(:title, :body, :user_id)
 end

end
