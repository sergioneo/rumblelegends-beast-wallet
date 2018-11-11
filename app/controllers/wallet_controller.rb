class WalletController < ApplicationController
  def index

  	address = params[:address]

  	returnHash = Hash.new

  	egg_req_url = ENV["CONTRACT_MASTER_SERVICE"]+"eggs/get_by_address?address="+address
  	eggs = Typhoeus.get(egg_req_url, followlocation: true).body

    beast_req_url = ENV["INFORMATION_SERVICE"]+"query/get?owner="+address
    beasts = Typhoeus.get(beast_req_url, followlocation: true).body

  	returnHash["eggs"] = eggs
  	returnHash["beasts"] = beasts
  	returnHash["items"] = {
  		"random" => 10,
  		"tickets" => 23,
  		"legendary" => 2,
  	}

  	render json: returnHash

  end
end
