class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: 'Book added'
    else
      render 'new'
    end
  end

  def update
    if params[:delete]
      @book.status = false
      @book.save
      redirect_to books_path, notice: 'Book deleted'

    else
      if @book.update(book_params)
        redirect_to @book, notice: "Book updated"
      else
        redirect_to books_path
      end
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def index
    @books = Book.all.where(:status => true)
  end

  def edit
  end



  private

  def set_book
    @book = Book.activeById(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :publisher, :description)
  end
end
