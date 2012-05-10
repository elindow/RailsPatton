class PlayersController < ActionController::Base

	def index
		@players = Players.all
	end

	def show
		@player = Player.find(params[id])
	end

	def new
		@player = Player.new
	end

	def create
		@player = Player.new(params[:player])
		if @player.save
			redirect_to @thing, notice: "Player was successfully created"
		else
			render action: "new"
		end
	end

	def update
		@player = Player.find(params[:id])
		if @player.update attributes(params[:player])
			redirect_to @player, notice:
			"Player was successfully updated"
		else
			render action "edit"
		end
	end

	def destroy
		@player = Players.find(params[:id])
		@player.destroy
		redirect_to players_url
	end
end
