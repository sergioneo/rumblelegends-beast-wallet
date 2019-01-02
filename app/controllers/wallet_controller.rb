class WalletController < ApplicationController
  def index

    beast_type_strings = {"0" => "dinosaur", "1" => "unicorn"}
  	address = params[:address]

  	returnHash = Hash.new

  	egg_req_url = ENV["CONTRACT_MASTER_SERVICE"]+"eggs/get_by_address?address="+address
  	eggs = Typhoeus.get(egg_req_url, followlocation: true).body

    beast_req_url = ENV["INFORMATION_SERVICE"]+"query?owner="+address+"&orderBy=external_id&start=0"
    query_result = JSON.parse(Typhoeus.get(beast_req_url, followlocation: true).body)
    beasts = query_result["hits"]
    image_base_url = ENV["IMAGE_GENERATION_SERVICE"]
    
    beasts.each do |beast|
      beast_type_strings[beast["beast_type"].to_s]
      image_url = image_base_url+beast_type_string+"/"+beast["genes"]
      beast["image_url"] = image_url
    end

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
