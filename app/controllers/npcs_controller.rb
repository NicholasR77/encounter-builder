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

    end

    def edit

    end

    def update

    end

    def destroy

    end
end
