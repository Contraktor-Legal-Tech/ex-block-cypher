defmodule ExBlockCypher.Operation do
  defstruct [:method, :path, :body, :query, :header]

  @token Application.get_env(:ex_block_cypher, :token)
  @main_url "https://api.blockcypher.com/v1"

  def new(chain, method, path \\ nil) do
    path = [Application.get_env(:ex_block_cypher, chain), path]
      |> Enum.reject(&is_nil/1)
      |> Enum.join("/")

    %__MODULE__{
      method: method,
      path: "#{@main_url}/#{path}"
    }
  end

  def body(operation, body) do
    %__MODULE__{operation | body: body}
  end

  def query(operation, query) do
    %__MODULE__{operation | query: query}
  end

  def header(operation, header) do
    %__MODULE__{operation | header: header}
  end

  def needs_token(operation) do
    %__MODULE__{operation | path: "#{operation.path}?token=#{@token}"}
  end
end