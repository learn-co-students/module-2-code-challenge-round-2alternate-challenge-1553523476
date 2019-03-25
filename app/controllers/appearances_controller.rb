class AppearancesController < ApplicationController
    def new
        @guests = Guest.all
        @episodes = Episode.all
    end

    def create
        @appearance = Appearance.new
        if @appearance.update(appearance_params)
            redirect_to episode_path(@appearance.episode)
        else
            render :new
        end
    end

    private

    def appearance_params
        params.require(:appearance).permit(:guest_id, :episode_id, :guest_rating)
    end
end
