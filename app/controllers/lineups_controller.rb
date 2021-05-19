class LineupsController < ApplicationController

    def index
        @lineups = Lineup.all
    end

    def new
        @lineup = Lineup.new
        @lineup.players.build
    end

    def create
        @lineup = Lineup.new(lineup_params)
        #binding.pry
        if @lineup.save
            redirect_to lineup_path(@lineup)
        else
            render :new 
        end
    end

    def show
        @lineup = Lineup.find(params[:id])
        #binding.pry
    end

    def edit
        @lineup = Lineup.find(params[:id])
    end

    def update
        @lineup = Lineup.find(params[:id])
        if @lineup.update(lineup_params)
            redirect_to lineup_path(@lineup)
        else
            render :edit
        end
    end

    def destroy
        @lineup = Lineup.find(params[:id])
        @lineup.destroy
        redirect_to lineups_path
    end

    private

    def lineup_params
        params.require(:lineup).permit(:name, players_attributes: [:id, :name, :position])
    end
end

