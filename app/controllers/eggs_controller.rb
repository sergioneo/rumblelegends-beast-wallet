class EggsController < ApplicationController
  def index

  	require 'json'

  	req_url = ENV["CONTRACT_MASTER_SERVICE"]+"eggs/get_by_address?address="+params[:id]
  	eggs = Typhoeus.get(req_url, followlocation: true).body

  	response = {"address" => params[:id], "eggs" => JSON.parse(eggs)}

  	render json: response
  end

  def marketplace_interaction

    require 'json'

    req_url = ENV["CONTRACT_MASTER_SERVICE"]+"eggs/get_contract_information"
    contract_info = JSON.parse(Typhoeus.get(req_url, followlocation: true).body)

    response = Hash.new
    response["address"] = contract_info["address"]
    response["abi"] = JSON.parse(contract_info["abi"])

    render json: response
  end
end
