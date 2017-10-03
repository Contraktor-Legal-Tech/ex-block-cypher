defmodule ExBlockCypher.Eth.ContractsTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias ExBlockCypher.{Eth}

  @solidity """
    pragma solidity ^0.4.0;

    contract SimpleStorage {
        uint storedData;

        function set(uint x) {
            storedData = x;
        }

        function get() constant returns (uint) {
            return storedData;
        }
    }
  """

  test "build a smart contract" do
    use_cassette "v1_eth_build" do
      response = Eth.Contracts.build(@solidity, [])
        |> ExBlockCypher.request()

      assert {:ok, body} = response
      assert {:ok, _} = Poison.decode(body)
    end
  end
end