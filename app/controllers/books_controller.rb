class BooksController < ApplicationController
  def new
  end

  def index
   @book = Book.new
   @books = Book.all
   @user = current_user
  end

  def create
   @book = Book.new(book_params)
   @book.user_id = current_user.id
   if @book.save
      flash[:notice] = "You have created book successfully"
      redirect_to book_path(@book.id)
   else
      @user = current_user
      @books = Book.all
      render :index
   end
  end

  def show
    @books = Book.find(params[:id])
    @book = Book.new
    @users = @books.user
  end

  def edit
    @books = Book.find(params[:id])
    if @books.user == current_user
      render :edit
    else
      redirect_to books_path
    end
  end

  def update
    @books = Book.find(params[:id])
    if @books.update(book_params)
      flash[:notice] = "You have updated book successfully"
      redirect_to book_path(@books.id)
    else
      render 'books/edit'
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private

  def book_params
    params.require(:book).permit(:title,:body)
  end
end