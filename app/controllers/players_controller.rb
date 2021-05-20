class PlayersController < ApplicationController
    before_action :logged_in?
    def index
        if params[:name]
            @players = Player.where('name LIKE ?', "%#{params[:name]}%")
        elsif params[:position]
            @players = Player.where('position LIKE ?', "%#{params[:position]}%")
        else
            @players = Player.all
        end
    end
    
    def new
        @player = Player.new
    end

    def create
        @player = Player.new(player_params)

        if @player.save
            redirect_to player_path(@player)
        else
            render :new 
        end
    end

    def show
        @player = Player.find(params[:id])
    end

    def edit
        @player = Player.find(params[:id])
    end

    def update
        @player = Player.find(params[:id])
        if @player.update(player_params)
            redirect_to player_path(@player)
        else
            render :edit
        end
    end

    def destroy
        @player = Player.find(params[:id])
        @player.destroy
        redirect_to players_path
    end

    private
    def require_login
        return head(:forbidden) unless session.include? :user_id
    end

    def player_params
        params.require(:player).permit(:name, :position)
    end
end
