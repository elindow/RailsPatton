class HittersController < ApplicationController

before_filter :get_hitter, :only => [ :edit, :show, :update, :destroy ]
	def get_hitter
		begin
			@hitter = Hitter.find(params[:id]) 
		rescue
			#puts "Hitter not found!"
			not_found
		end
	end
	
	#GET /hitters	
	def index
		#Hitter.order("lname")
		@hitters = Hitter.all
	end
	
	#GET /hitter/new
	def new
	@hitter = Hitter.new
	end

	#GET /hitter/edit/1
	def edit
	end

	#POST /hitter
	def create
		@hitter = Hitter.new(params[:hitter])
		if @hitter.save
			redirect_to @hitter, notice: "Data was successfully added"
		else
			render action: "new"
		end
	end

	#PUT hitter/1
	def update
		#@hitter = Hitter.find(params[:id])
		if @hitter.update_attributes(params[:hitter])
			redirect_to(@hitter, :notice => "Data was successfully updated")
		else
			render action "edit"
		end
	end
	  
	#GET /hitter/1
	def show
	  
	end
	
	#DELETE hitter/1
	def destroy
		#@player = Player.find(params[:id])
		@hitter.destroy
		redirect_to hitters_url
	end
end
