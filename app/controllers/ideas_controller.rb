class IdeasController < ApplicationController
    # ==============CREATE========================
    def new
        @idea = Idea.new
    end

    def create
        @idea = Idea.new(idea_params)
        if @idea.save
            flash[:notice]= "Idea created successfully!"
            redirect_to idea_path(@idea)
        else
            # flash[:alert]= "Title must be unique and body must has at least 50 characters"
            render :new, status: 303  
        end
       
        
    end
    # ================READ========================
    def index
        @ideas = Idea.order(created_at: :desc)
    end

    def show

    end
    # ===============UPDATE==========================
    def edit

    end

    def update
        if @idea.update(idea_params)
            redirect_to idea_path(@idea)
          else
            render :edit
          end
    end
    # ================DELETE=========================
    def destroy
        @idea.destroy
        flash[:danger] = "Idea has been deleted!"
        redirect_to ideas_path
    end

    private

    def idea_params
        params.require(:idea).permit(:title, :description)
    end
end
