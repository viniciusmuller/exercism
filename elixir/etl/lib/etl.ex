defmodule ETL do
  @doc """
  Transform an index into an inverted index.

  ## Examples

  iex> ETL.transform(%{"a" => ["ABILITY", "AARDVARK"], "b" => ["BALLAST", "BEAUTY"]})
  %{"aardvark" => "a", "ability" => "a", "ballast" => "b", "beauty" => "b"}
  """
  @spec transform(map) :: map
  def transform(input) do
    Enum.reduce(input, %{}, &do_transform/2)
  end

  defp do_transform({key, values}, acc) do
    values
    |> Enum.map(&String.downcase/1)
    |> Enum.reduce(acc, &Map.put(&2, &1, key))
  end
end
