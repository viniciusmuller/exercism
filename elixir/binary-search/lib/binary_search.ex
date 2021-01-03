defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """
  def search({}, _), do: :not_found

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search(numbers, key) do
    do_search(numbers, key, 0, tuple_size(numbers) - 1)
  end

  defp do_search(_, _, low, high) when high < low, do: :not_found

  defp do_search(numbers, key, low, high) do
    middle = div(high + low, 2)
    item = elem(numbers, middle)
    cond do
      item == key -> {:ok, middle}
      item > key -> do_search(numbers, key, low, middle - 1)
      item < key -> do_search(numbers, key, middle + 1, high)
    end
  end

  # @spec search(tuple, integer) :: {:ok, integer} | :not_found
  # def search({}, _key), do: :not_found
  # def search(tuple, key) do
  #   {lo, hi} = {0, tuple_size(tuple) - 1}
  #   search(tuple, key, lo, hi)
  # end
  # def search(tuple, key, lo, hi) do
  #   cond do
  #     hi >= lo ->
  #       mid = lo + div(hi - lo, 2)
  #       k = elem(tuple, mid)
  #       cond do
  #         k == key -> {:ok, mid}
  #         k > key  -> search(tuple, key, lo, mid - 1)
  #         k < key  -> search(tuple, key, mid + 1, hi)
  #       end
  #     true -> :not_found
  #   end
  # end
end
