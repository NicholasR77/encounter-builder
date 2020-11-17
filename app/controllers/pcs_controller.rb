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
   
   end

    def edit
    
    end

    def update
    
    end

    def destroy
    
    end
end
