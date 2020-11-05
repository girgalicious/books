class BooksController < ApplicationController
    def index
        @books = Book.paginate(page: params[:page] || 1)
    end
    
    def new
        @book = Book.new
    end
    
    def create
        @book = Book.new(book_params)
        if @book.save
            redirect_to :controller => 'books', :action => 'index'
        else
            redirect_to :controller => 'books', :action => 'new'
        end
    end
    
    def edit
        @book = Book.find(params[:id])
    end
    
    def show
        @book = Book.find(params[:id])
    end
    
    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
            redirect_to :controller => 'books', :action => 'index'
        else
            redirect_to :controller => 'books', :action => 'new'
        end
    end
    
    def destroy
        @book = Book.find(params[:id])
        @book.destroy!
        
        redirect_to :controller => 'books', :action => 'index'
    end
    
    def book_params
      params.require(:book).permit(:name, :author)
    end
end
