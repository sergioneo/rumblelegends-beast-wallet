class CharacterController < ApplicationController
  def view

  	res = Character.where(:external_id => 123)

  	if res.first.nil?
  		# CALL SMART CONTRACT
  		response = {"external_id": params[:id], "adn" => 125956848284}
  		mychar = Character.create(response)
  	else
  		mychar = res.first
  	end

  	render json: mychar

  end
end
