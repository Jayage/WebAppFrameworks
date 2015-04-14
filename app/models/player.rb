class Player < ActiveRecord::Base
  belongs_to :team
  attr_accessible :college, :number, :player_name
end
