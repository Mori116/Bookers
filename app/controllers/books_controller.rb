class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    if @book.save
       flash[:notice] = 'Book was successfully created.'
       redirect_to book_path(@book)
    else
       @books = Book.all
       render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       flash[:notice] = 'Book was successfully created.'
       redirect_to book_path(@book)
    else
       @books = Book.all
       render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:success] = "Book was successfully destroyed."
    redirect_to '/books'
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
