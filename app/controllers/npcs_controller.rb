class NpcsController < ApplicationController
    before_action :check_logged_in

    def index
        @npcs = Npc.all
    end

    def show
        @npc = Npc.find(params[:id])
    end

    def new
        @npc = Npc.new
    end

    def create
        npc = Npc.new(npc_params)
        if npc.save
            redirect_to npc_path(npc)
        else
            redirect_to new_npc_path
        end
    end

    def edit
        @npc = Npc.find(params[:id])
    end

    def update
        npc = Npc.find(params[:id])
        if npc.update(npc_params)
            redirect_to npc_path(npc)
        else
            redirect_to edit_npc_path(npc)
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
end
