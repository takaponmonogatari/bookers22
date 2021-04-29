class BooksController < ApplicationController

 def create
  @book = Book.new(book_params)
  @book.user_id = current_user.id
  if @book.save
   redirect_to book_path(@book.id)
   flash[:notice] = "You have created book successfully."
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
  @book = Book.find(params[:id])
  @book_new = Book.new
  @user = @book.user

 end

 def edit
  @book = Book.find(params[:id])
  screen_user(@book)
 end

 def update
  @book = Book.find(params[:id])
  if @book.update(book_params)
   redirect_to book_path(@book)
    flash[:notice] = "You have updated book successfully."
  else
   render :edit
   @books = Book.all
   flash[:alert]
  end
 end

 def destroy
  book = Book.find(params[:id])
  book.destroy
  redirect_to books_path
 end

 private
 def ensure_user
  @user = User.find(params[:id])
  redirect_to user_path(current_user) unless @user == current_user
 end

 def book_params
  params.require(:book).permit(:title, :body, :user_id)
 end

 def screen_user(book)
     if book.user.id != current_user.id
      redirect_to books_path
     end
 end

end
