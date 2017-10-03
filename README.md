# ExBlockCypher  [![Build Status](https://semaphoreci.com/api/v1/eduardonunesp/ex-block-cypher/branches/master/badge.svg)](https://semaphoreci.com/eduardonunesp/ex-block-cypher)


Third party module for interact with Block Cypher API

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ex_block_cypher` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_block_cypher, "~> 0.1.0"}
  ]
end
```

## How to

Setup the configuration file with the values for the chains according with the BlockCypher, for instance to use test chains for Ethereum and Bitcoin you can set in your config file:

```elixir
config :ex_block_cypher, [
  eth_chain: "beth/test",
  btc_chain: "btc/test3"
]
```

## Example

Now you can request the current state for both Blockchains:

```elixir
# Bitcoin
Btc.Objects.blockchain() |> ExBlockCypher.request()

# Ethereum
Eth.Objects.blockchain() |> ExBlockCypher.request()
```
