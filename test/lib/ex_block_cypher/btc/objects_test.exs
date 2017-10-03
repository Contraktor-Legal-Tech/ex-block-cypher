defmodule ExBlockCypher.Btc.ObjectsTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias ExBlockCypher.{Btc}

  describe "objects" do
    test "get btc blockchain info" do
      use_cassette "v1_btc_blockchain" do
        response = Btc.Objects.blockchain()
          |> ExBlockCypher.request()

        assert {:ok, body} = response
        assert {:ok, body} = Poison.decode(body)
        assert body["hash"] == "000000000000000ec66a83c1fdd462c32ab07220ef1f10cb412ac3d4e0077d3b"
      end
    end

    test "get btc block info" do
      use_cassette "v1_btc_block" do
        response = Btc.Objects.block("00000000000017999260e3eb56a88bb7dfd67d2364c2c7265f5eda302bd73bf6")
          |> ExBlockCypher.request()

        assert {:ok, body} = response
        assert {:ok, body} = Poison.decode(body)
        assert body["hash"] == "00000000000017999260e3eb56a88bb7dfd67d2364c2c7265f5eda302bd73bf6"
      end
    end

    test "get btc txs info" do
      use_cassette "v1_btc_txs" do
        response = Btc.Objects.txs("ed52d40cf4b0695e0c99dc99d7bac032cfdc12a569225422d71dc61e2e44fce4")
          |> ExBlockCypher.request()

        assert {:ok, body} = response
        assert {:ok, body} = Poison.decode(body)
        assert body["block_hash"] == "0000000024e396f1ab722e7cf4dbc24cfa4ede1bbfd13f272d8a9749a7304327"
      end
    end

    test "get btc address info" do
      use_cassette "v1_btc_address" do
        response = Btc.Objects.address("mvAC9cFCctBbUHz4Lj1pAp1PcxKJQ56nRW")
          |> ExBlockCypher.request()

        assert {:ok, body} = response
        assert {:ok, body} = Poison.decode(body)
        assert body["final_balance"] == 3060932561
      end
    end
  end
end
