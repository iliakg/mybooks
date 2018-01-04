class BooksController < ApplicationController

  def index
    @books = Book.order(created_at: :desc)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(page_params)

    if @book.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to root_path
  end

  private

  def page_params
    params.require(:book).permit(:title, :author, :attached_file)
  end
end
