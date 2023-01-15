class BooksController < ApplicationController
  def new
  end

  def create
    @book = Book.new(book_params)
    @booklists = Book.all
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def index
    @book = Book.new
    @booklists = Book.all
  end

  def show
    @booklist = Book.find(params[:id])
  end

  def edit
    @book = Book.new
    @booklist = Book.find(params[:id])
  end

  def update
    @booklist = Book.find(params[:id])
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to '/books'
  end

  private
    def book_params
      params.require(:book).permit(:title, :body)
    end
end
