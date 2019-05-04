class TasksController < ApplicationController

    def index
        @tasks = Task.all
    end

    def new
        @task = Task.new
        @task.taggings.build
    end

    def create
        @task = Task.new(params_create)
        if @task.save
            redirect_to root_url
        else
            render "new"
        end
    end

    def edit
        @task = Task.find(params[:id])
    end

    def update
        @task = Task.find(params[:id])
        if @task && @task.update_attributes(params_update)
            redirect_to root_url
        else
            render "edit"
        end
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to root_url
    end


    private
        def params_create
            # fields_forを使っていないときは、attributeは不要
            params.require(:task).permit(:content,tag_ids:[])
        end

        def params_update
            params.require(:task).permit(:content,tag_ids:[])
        end


end
