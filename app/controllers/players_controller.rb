class PlayersController < ActionController::Base

	def index
		@players = Players.all
	end

	def show
		@players = Players.find(params[id])
	end

	def new
		@player = Players.new
	end

	def create
		@player = Players.new(params[:player])
		if @player.save
			redirect_to @thing, notice: "Player was successfully created"
		else
			render action: "new"
		end
	end

	def update
		@player = player.find(params[:id])
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
