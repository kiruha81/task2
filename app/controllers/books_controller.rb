class BooksController < ApplicationController
  def new
  end

  def create
    book = Book.new(book_params)
    book.save
    flash[:notice] = "Book was successfully created"
    redirect_to book_path(book.id)
  end

  def index
    @allbooks = Book.new
    @booklists = Book.all
  end

  def show
    @booklist = Book.find(params[:id])
  end

  def edit
    @booklist = Book.find(params[:id])
    @booklists = Book.all
  end

  def update
    @booklist = Book.find(params[:id])
    book = Book.find(params[:id])
    book.update(book_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private
    def book_params
      params.require(:book).permit(:title, :body)
    end
end
