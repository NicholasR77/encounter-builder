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
end
