class PcsController < ApplicationController
    before_action :check_logged_in
    before_action :check_params_id, only: [:show, :edit]
    before_action :require_permission, only: [:show, :edit, :update, :destroy]
    

    def index
        @pcs = helpers.current_user.pcs.ordered_by_name_asc
    end

    def show
        @pc = Pc.find(params[:id])
    end

    def new
        @pc = Pc.new
    end

    def create
        @pc = Pc.new(pc_params)
        @pc.user_id = helpers.current_user.id
        if @pc.save
            redirect_to pc_path(@pc)
            flash.alert = 'PC created succesfully.'
        else
            render :new
        end
    end

    def edit
        @pc = Pc.find(params[:id])
    end

    def update
        @pc = Pc.find(params[:id])
        if @pc.update(pc_params)
            redirect_to pc_path(@pc)
            flash.alert = 'PC updated succesfully.'
        else
            render :edit
        end
    end

    def destroy
        pc = Pc.find(params[:id])
        pc.destroy
        flash.alert = 'PC deleted succesfully.'
        redirect_to pcs_path
    end

    protected

    def pc_params
        params.require(:pc).permit(:name, :description, item_ids:[])
    end

    def check_params_id
        unless Pc.exists?(id: params[:id])
            flash[:danger] = 'PC not found.'
            redirect_to root_path
        end
    end

    def require_permission
        unless helpers.current_user.id == Pc.find(params[:id]).user_id
            flash[:danger] = 'You do not have access to this page.'
            redirect_to root_path
        end
    end
    
end
