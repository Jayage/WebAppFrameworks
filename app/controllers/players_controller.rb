class PlayersController < ApplicationController
  # GET /teams/1/players 
  def index 
    # For URL like /teams/1/player 
    # Get the team with id=1 
    @team = Team.find(params[:team_id]) 
    # Access all players for that team 
    @players = @team.players 
  end 
  
  # GET /teams/1/players/2 
  def show
    @team = Team.find(params[:team_id]) 
    # For URL like /teams/1/players/2 
    # Find an player in teams 1 that has id=2 
    @player = @team.players.find(params[:id]) 
  end 
  
  # GET /teams/1/players/new 
  def new 
    @team = Team.find(params[:team_id]) 
    # Associate an player object with team 1 
    @player = @team.players.build 
  end 

  #POST /teams/1/players 
  def create 
    @team = Team.find(params[:team_id]) 
    # For URL like /teams/1/players 
    # Populate an player associate with team 1 with form data 
    # Team will be associated with the player 
    @player = @team.players.build(params[:player]) 
      if @player.save 
        # Save the player successfully 
        redirect_to team_player_url(@team, @player) 
      else 
          render :action => "new" 
      end 
  end 
  
  # GET /teams/1/players/2/edit 
  def edit 
    @team = Team.find(params[:team_id]) 
    # For URL like /teams/1/players/2/edit 
    # Get player id=2 for team 1 
    @player = @team.players.find(params[:id]) 
  end 
  
  # PUT /teams/1/players/2 
  def update 
    @team = Team.find(params[:team_id]) 
    @player = Player.find(params[:id]) 
    if 
      @player.update_attributes(params[:player]) 
      # Save the player successfully
      redirect_to team_player_url(@team, @player) 
      else 
        render :action => "edit" 
     end 
  end 
  
  # DELETE /teams/1/players/2 
  def destroy 
    @team = Team.find(params[:team_id]) 
    @player = Player.find(params[:id]) 
    @player.destroy 
    
    respond_to do |format| 
      format.html { redirect_to team_players_path(@team) } 
      format.xml { head :ok } 
    end 
  end
  
end
