class EggsController < ApplicationController
  def index

  	require 'json'

  	req_url = ENV["CONTRACT_MASTER_SERVICE"]+"eggs/get_by_address?address="+params[:id]
  	eggs = Typhoeus.get(req_url, followlocation: true).body

  	response = {"address" => params[:id], "eggs" => JSON.parse(eggs)}

  	render json: response
  end

  def marketplace_interaction
  	response = Hash.new
  	response["abi"] = JSON.parse('[{"constant": false, "inputs": [{"name": "_eggId", "type": "uint256"}, {"name": "_amount", "type": "uint256"} ], "name": "buyEgg", "outputs": [], "payable": true, "stateMutability": "payable", "type": "function"}, {"constant": false, "inputs": [{"name": "_eggId", "type": "uint256"}, {"name": "_max", "type": "uint256"}, {"name": "_customGene", "type": "uint256"}, {"name": "_price", "type": "uint256"}, {"name": "_increase", "type": "uint256"}, {"name": "_active", "type": "bool"}, {"name": "_open", "type": "bool"} ], "name": "createEggScheme", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function"}, {"anonymous": false, "inputs": [{"indexed": false, "name": "beastId", "type": "uint256"} ], "name": "EggOpened", "type": "event"}, {"constant": false, "inputs": [{"name": "_eggId", "type": "uint256"}, {"name": "_amount", "type": "uint256"} ], "name": "openEgg", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function"}, {"constant": false, "inputs": [{"name": "_eggId", "type": "uint256"}, {"name": "state", "type": "bool"} ], "name": "setActiveStatusEgg", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function"}, {"constant": false, "inputs": [{"name": "_eggId", "type": "uint256"}, {"name": "state", "type": "bool"} ], "name": "setOpenStatusEgg", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function"}, {"constant": true, "inputs": [{"name": "_eggId", "type": "uint256"} ], "name": "currentEggPrice", "outputs": [{"name": "", "type": "uint256"} ], "payable": false, "stateMutability": "view", "type": "function"}, {"constant": true, "inputs": [{"name": "", "type": "uint256"} ], "name": "eggs", "outputs": [{"name": "id", "type": "uint256"}, {"name": "max", "type": "uint256"}, {"name": "buy", "type": "uint256"}, {"name": "customGene", "type": "uint256"}, {"name": "increase", "type": "uint256"}, {"name": "price", "type": "uint256"}, {"name": "active", "type": "bool"}, {"name": "open", "type": "bool"}, {"name": "isEggScheme", "type": "bool"} ], "payable": false, "stateMutability": "view", "type": "function"}, {"constant": true, "inputs": [{"name": "", "type": "address"}, {"name": "", "type": "uint256"} ], "name": "eggsOwned", "outputs": [{"name": "", "type": "uint256"} ], "payable": false, "stateMutability": "view", "type": "function"} ]')
  	response["address"] = "0xa277079d1b19c70c28f5afed0a3e6fcf6740ba8c"

  	render json: response
  end
end
