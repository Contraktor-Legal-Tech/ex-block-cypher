defmodule ExBlockCypher.Objects do
  defmacro __using__(options) do
    quote do
      alias ExBlockCypher.Operation

      def blockchain do
        Operation.new(unquote(options[:chain]), :get)
      end

      def block(block_number) do
        Operation.new(unquote(options[:chain]), :get, "blocks/#{block_number}")
      end

      def txs(transaction_id) do
        Operation.new(unquote(options[:chain]), :get, "txs/#{transaction_id}")
      end

      def address(address_id) do
        Operation.new(unquote(options[:chain]), :get, "addrs/#{address_id}")
      end
    end
  end
end
