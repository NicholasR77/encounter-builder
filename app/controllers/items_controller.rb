class ItemsController < ApplicationController
    before_action :check_logged_in
    before_action :check_params_id, only: [:show, :edit]
    before_action :require_permission, only: [:show, :edit, :update, :destroy]

    def index
        if params[:pc_id]
            pc = Pc.find(params[:pc_id])
            if pc.nil?
                redirect_to pcs_path, alert: "PC not found."
            elsif helpers.current_user.id == pc.user_id
                @items = pc.items.ordered_by_name_asc
            else
                flash[:danger] = 'You do not have access to this page.'
                redirect_to root_path
            end
        elsif params[:query]
            @items = Item.find_items(params[:query])
        else
            @items = helpers.current_user.items.ordered_by_name_asc
        end
    end

    def show
        if params[:pc_id]
            pc = Pc.find(params[:pc_id])
            @item = Item.find(params[:id])
            if pc.nil?
                redirect_to pcs_path, alert: "PC not found."
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

    def check_params_id
        unless Item.exists?(id: params[:id])
            flash[:danger] = 'Item not found.'
            redirect_to root_path
        end
    end

    def require_permission
        unless helpers.current_user.id == Item.find(params[:id]).user_id
          flash[:danger] = 'You do not have access to this page.'
          redirect_to root_path
        end
    end
end
