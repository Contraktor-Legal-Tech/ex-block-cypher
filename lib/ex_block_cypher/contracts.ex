defmodule ExBlockCypher.Contracts do
  defmacro __using__(_) do
    quote do
      import ShorterMaps
      alias ExBlockCypher.Operation
    end
  end
end
