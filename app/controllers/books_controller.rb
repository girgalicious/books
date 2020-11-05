class BooksController < ApplicationController
    def index
        @books = policy_scope(Book)
    end
    
    def new
        authorize Book
        @book = Book.new
    end
    
    def create
        authorize Book
        @book = Book.new(book_params)
        @book.creator_id = current_user.id
        if @book.save
            redirect_to :controller => 'books', :action => 'index'
        else
            redirect_to :controller => 'books', :action => 'new'
        end
    end
    
    def edit
       @book = book
       authorize @book
    end
    
    def show
        @book = book
    end
    
    def update
        @book = book
        authorize @book
        if @book.update(book_params)
            redirect_to :controller => 'books', :action => 'index'
        else
            redirect_to :controller => 'books', :action => 'new'
        end
    end
    
    def destroy
        @book = book
        authorize @book
        @book.destroy!
        
        redirect_to :controller => 'books', :action => 'index'
    end
    
    def book
        policy_scope(Book).find(params[:id])
    end
    
    def book_params
      params.require(:book).permit(:name, :author)
    end
end
