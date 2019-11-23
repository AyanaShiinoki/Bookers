class BooksController < ApplicationController
  def top
  end

  def index
    @books=Book.all
    @book=Book.new
  end

  def show
    @book=Book.find(params[:id])
  end

  def new
    @book=Book.new
  end

  def create
    book=Book.new(book_params)
    if book.save
    flash[:notice]="Book was successfully created."
    redirect_to  book_path(book.id) 
    else
    #空欄時の処理
    end
  end

  def edit
    @book = Book.find(params[:id])

  end

  def update
    book=Book.find(params[:id])
    if book.update(book_params)
    flash[:notice2]="Book was successfully updated."
    redirect_to  book_path(book.id)
    else
    #空欄時の処理
    end
  end


 def destroy
    book = Book.find(params[:id])
    if book.destroy
    flash[:notice3]="Book was successfully destroyed."
    redirect_to books_path
  end
  end

private
  def book_params
    params.require(:book).permit(:title,:body)
  end


end
