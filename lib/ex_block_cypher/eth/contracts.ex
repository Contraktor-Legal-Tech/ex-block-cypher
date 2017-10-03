defmodule ExBlockCypher.Eth.Contracts do
  use ExBlockCypher.Contracts

  def build(solidity, params) when is_binary(solidity) and is_list(params) do
    Operation.new(:eth_chain, :post, "contracts")
    |> Operation.body(~M{solidity, params})
    |> Operation.needs_token()
  end

  def publish(publish, solidity, params, private, gas_limit) when is_binary(solidity) and is_list(params) do
    Operation.new(:eth_chain, :post, "contracts")
    |> Operation.body(~M{publish, solidity, params,  private, gas_limit})
    |> Operation.needs_token()
  end

  def get(address) when is_binary(address) do
    Operation.new(:eth_chain, :get, "contracts/#{address}")
    |> Operation.needs_token()
  end

  def call(address, method, params, private, gas_limit) when is_list(params) do
    Operation.new(:eth_chain, :post, "contracts/#{address}/#{method}")
    |> Operation.body(~M{params, private, gas_limit})
    |> Operation.needs_token()
  end
end
