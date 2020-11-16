class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(clean_book)
    if @book.save
      flash[:notice] = "新增成功"
      redirect_to '/books'
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(clean_book)
      flash[:notice] = "編輯成功"
      redirect_to '/books'
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "刪除成功"
    redirect_to '/books'
  end

  private
  def clean_book
    params.require(:book).permit(:name, :author, :pirce, :comment)
  end
end