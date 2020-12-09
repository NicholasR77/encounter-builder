class NpcsController < ApplicationController
    before_action :check_logged_in
    before_action :check_params_id, only: [:show, :edit]
    before_action :require_permission, only: [:show, :edit, :update, :destroy]

    def index
        @npcs = helpers.current_user.npcs.ordered_by_name_asc
    end

    def show
        @npc = Npc.find(params[:id])
        if @npc.nil?
            redirect_to npcs_path, alert: "NPC not found."
        end
    end

    def new
        @npc = Npc.new
    end

    def create
        @npc = Npc.new(npc_params)
        @npc.user_id = helpers.current_user.id
        if @npc.save
            redirect_to npc_path(@npc)
            flash.alert = 'NPC created succesfully.'
        else
            render :new
        end
    end

    def edit
        @npc = Npc.find(params[:id])
        if @npc.nil?
            redirect_to npcs_path, alert: "NPC not found."
        end
    end

    def update
        @npc = Npc.find(params[:id])
        if @npc.update(npc_params)
            redirect_to npc_path(@npc)
            flash.alert = 'NPC updated succesfully.'
        else
            render :edit
        end
    end

    def destroy
        npc = Npc.find(params[:id])
        npc.destroy
        flash.alert = 'NPC deleted succesfully.'
        redirect_to npcs_path
    end

    protected

    def npc_params
        params.require(:npc).permit(:name, :description)
    end

    def check_params_id
        unless Npc.exists?(id: params[:id])
            flash[:danger] = 'NPC not found.'
            redirect_to root_path
        end
    end

    def require_permission
        unless helpers.current_user.id == Npc.find(params[:id]).user_id
          flash[:danger] = 'You do not have access to this page.'
          redirect_to root_path
        end
    end
end
