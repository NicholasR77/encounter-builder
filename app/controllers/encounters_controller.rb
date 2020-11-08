class EncountersController < ApplicationController
  def index
    @encounters = Encounter.all
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

  protected

  def encounter_params
    params.require(:encounter).permit(:name, :description)
  end
end
