class EncountersController < ApplicationController
  def index
    @encounters = Encounter.all
  end

  def show
    @encounter = Encounter.find(params[:id])
  end

  def new
    @encounter = Encounter.new
  end

  def create
    encounter = Encounter.new(encounter_params)
    if encounter.save
      redirect_to encounter_path(encounter)
    else
      new_encounter_path
    end
  end

  def edit
    @encounter = Encounter.find(params[:id])
  end

  def update
    encounter = Encounter.find(params[:id])
    if encounter.update(encounter_params)
      redirect_to encounter_path(encounter)
    else
      redirect_to edit_encounter_path(encounter)
    end
  end

  def destroy
    encounter = Encounter.find(params[:id])
    encounter.destroy
    redirect_to encounters_path
  end

  protected

  def encounter_params
    params.require(:encounter).permit(
      :name,
      :description,
      pc_ids: [],
      pcs_attributes: [:name],
      npc_ids: [],
      npcs_attributes: [:name]
    )
  end
end
