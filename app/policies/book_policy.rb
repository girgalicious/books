class BookPolicy
    attr_reader :user, :book

    def initialize(user, book)
        @user = user
        @book = book
    end
    
    def new?
        true
    end
    
    def create?
        true
    end
    
    def edit?
        if user.administrator? || user.moderator?
            true
        else
            @book.creator_id === @user.id
        end
    end
    
    def update?
        edit?
    end
    
    def destroy?
        update?
    end
    
    class Scope
        def initialize(user, scope)
            @user  = user
            @scope = scope
        end
        
        def resolve
            if user.administrator? || user.moderator?
                scope.all
            else
                scope.where(creator: user)
            end
        end
    
        private
    
        attr_reader :user, :scope
    end
end