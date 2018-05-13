class EggsController < ApplicationController
  def index

  	require 'json'

  	req_url = ENV["CONTRACT_MASTER_SERVICE"]+"eggs/get_by_address?address="+params[:id]
  	eggs = Typhoeus.get(req_url, followlocation: true).body

  	response = {"address" => params[:id], "eggs" => JSON.parse(eggs)}

  	render json: response
  end
end
