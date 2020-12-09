class ItemsController < ApplicationController
    before_action :check_logged_in

    def index
        if params[:pc_id]
            pc = Pc.find(params[:pc_id])
            if pc.nil?
                redirect_to pcs_path, alert: "PC not found."
            else
                @items = pc.items
            end
        else
            @items = Item.all
        end
    end

    def show
        if params[:pc_id]
            pc = Pc.find(params[:pc_id])
            @item = Item.find(params[:id])
            if pc.nil?
                redirect_to pcs_path, alert: "PC not found."
            elsif @item.nil?
                redirect_to pcs_path, alert: "Item not found."
            end
        else
            @item = Item.find(params[:id])
        end
    end

    def new
        if params[:pc_id]
            @item = Item.new(pc_id: params[:pc_id])
        else
            @item = Item.new
        end
    end

    def create
        @item = Item.new(item_params)
        @item.user_id = helpers.current_user.id
        if @item.save
            redirect_to item_path(@item)
            flash.alert = 'Item created succesfully.'
        else
            render :new
        end
    end

    def edit
        if params[:pc_id]
            pc = Pc.find(params[:pc_id])
            @item = Item.find(params[:id])
            if pc.nil?
                redirect_to pcs_path, alert: "PC not found."
            elsif @item.nil?
                redirect_to pcs_path, alert: "Item not found."
            end
        else
            @item = Item.find(params[:id])
        end
    end

    def update
        @item = Item.find(params[:id])
        if @item.update(item_params)
            redirect_to item_path(@item)
            flash.alert = 'Item updated succesfully.'
        else
            render :edit
        end
    end

    def destroy
        item = Item.find(params[:id])
        item.destroy
        flash.alert = 'Item deleted succesfully.'
        redirect_to items_path
    end

    protected

    def item_params
        params.require(:item).permit(:name, :description, :notes, :rarity, :cost, :pc_id)
    end
end
