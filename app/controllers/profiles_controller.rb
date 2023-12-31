class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[show edit update]

  # GET /profiles/1 or /profiles/1.json
  def show; end

  # GET /profiles/1/edit
  def edit; end

  # PATCH/PUT /profiles/1 or /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to profile_url(@profile), notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_profile
    @profile = Profile.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def profile_params
    params.fetch(:profile, {})
    params.require(:profile).permit(:name, :birthday)
  end
end
