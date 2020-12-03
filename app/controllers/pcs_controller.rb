class PcsController < ApplicationController
    before_action :check_logged_in

    def index
        @pcs = Pc.all
    end

    def show
        @pc = Pc.find(params[:id])
    end

    def new
        @pc = Pc.new
    end

    def create
        pc = Pc.new(pc_params)
        if pc.save
            redirect_to pc_path(pc)
        else
            redirect_to new_pc_path
        end
    end

    def edit
        @pc = Pc.find(params[:id])
    end

    def update
        pc = Pc.find(params[:id])
        if pc.update(pc_params)
            redirect_to pc_path(pc)
        else
            redirect_to edit_pc_path(pc)
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
        params.require(:pc).permit(:name, :description)
    end
end
