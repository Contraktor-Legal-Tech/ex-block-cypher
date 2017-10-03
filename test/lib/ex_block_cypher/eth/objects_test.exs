defmodule ExBlockCypher.Eth.ObjectsTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias ExBlockCypher.{Eth}

  describe "objects" do
    test "get eth blockchain info" do
      use_cassette "v1_eth_blockchain" do
        response = Eth.Objects.blockchain()
          |> ExBlockCypher.request()

        assert {:ok, body} = response
        assert {:ok, body} = Poison.decode(body)
        assert body["hash"] == "3ddbdfa84015f21459373969e8561d70a30e0d2fa14081aaab9f14225c8eb323"
      end
    end

    test "get eth block info" do
      use_cassette "v1_eth_block" do
        response = Eth.Objects.block("7")
          |> ExBlockCypher.request()

        assert {:ok, body} = response
        assert {:ok, body} = Poison.decode(body)
        assert body["coinbase_addr"] == "dd2f1e6e498202e86d8f5442af596580a4f03c2c"
      end
    end
  end
end
