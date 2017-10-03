defmodule ExBlockCypher do
  @moduledoc """
  Documentation for ExBlockCypher.
  """

  use HTTPoison.Base

  import ShorterMaps

  @http_opts [timeout: 60_000, recv_timeout: 60_000]
  @success_stasuses [200, 201]

  def request(%ExBlockCypher.Operation{} = operation) do
    do_request(operation)
    |> process_result()
  end

  defp do_request(~M{method: :get, path}) do
    get(path, [], @http_opts)
  end

  defp do_request(~M{method: :post, path, body}) do
    post(path, Poison.encode!(body), @http_opts)
  end

  defp process_result(result) do
    with {:ok, response} <- result,
      ~M{body, status_code} <- response
    do
      cond do
        status_code in @success_stasuses ->
          {:ok, body}
        true -> {:error, body}
      end
    else
      {:error, reason} ->
        {:error, reason}
    end
  end
end
