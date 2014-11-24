class ProfilesController < ApplicationController

	def new
		if current_user.profile
			redirect_to profile_path(current_user.profile)
		end
		@profile =  Profile.new
	end

	def create
		@profile = Profile.new(profile_params)
		@profile.user = current_user
		if @profile.save
			flash[:sucess] = "Profile sucessfully created"
			redirect_to profile_path(current_user)
		else
			flash.now[:danger] = "Please fix errors below"
			render 'new'
		end

	end

	def show
		@profile = Profile.find(params[:id])
	end

	def profile_params
		params.require(:profile).permit(:description, :pic)
	end

end
