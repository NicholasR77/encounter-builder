class EncountersController < ApplicationController
  before_action :check_logged_in
  before_action :check_params_id, only: [:show, :edit]
  before_action :require_permission, only: [:show, :edit, :update, :destroy]

  def index
    @encounters = helpers.current_user.encounters.ordered_by_name_asc
  end

  def show
    @encounter = Encounter.find(params[:id])
  end

  def new
    @encounter = Encounter.new
  end

  def create
    # Try to refactor and use throughout the app
    @encounter = helpers.current_user.encounters.build(encounter_params)
    
    if @encounter.save
      redirect_to encounter_path(@encounter)
      flash.alert = 'Encounter created succesfully.'
    else
      render :new
    end
  end

  def edit
    @encounter = Encounter.find(params[:id])
  end

  def update
    @encounter = Encounter.find(params[:id])
    if @encounter.update(encounter_params)
      redirect_to encounter_path(@encounter)
      flash.alert = 'Encounter updated succesfully.'
    else
      render :edit
    end
  end

  def destroy
    encounter = Encounter.find(params[:id])
    encounter.destroy
    flash.alert = 'Encounter deleted succesfully.'
    redirect_to encounters_path
  end

  def show_combat
    @encoutner = Encounter.find(params[:id])
  end

  def new_combat
    @encounter = Encounter.find(params[:id])
  end

  def create_combat
    
  end

  protected

  def encounter_params
    params.require(:encounter).permit(
      :name,
      :description,
      encounter_npcs_attributes: [:turn_order, :id],
      pc_ids: [],
      npc_ids: []
    )
  end

  def check_params_id
    unless Encounter.exists?(id: params[:id])
        flash[:danger] = 'Encounter not found.'
        redirect_to root_path
    end
  end

  def require_permission
    unless helpers.current_user.id == Encounter.find(params[:id]).user_id
      flash[:danger] = 'You do not have access to this page.'
      redirect_to root_path
    end
  end
end
