class LineupsController < ApplicationController

    def new
        @lineup = Lineup.new
        @lineup.players.build
    end

    def create
        @lineup = Lineup.new(lineup_params)

        if @lineup.save
            redirect_to lineup_path(@lineup)
        else
            render :new 
        end
    end

    def show
        @lineup = Lineup.find(params[:id])
        binding.pry
    end

    private

    def lineup_params
        params.require(:lineup).permit(:name, player_attributes: [:id, :name, :position])
    end
end

