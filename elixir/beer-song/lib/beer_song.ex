defmodule BeerSong do
  defp generate_beer(n) do
    s = n >= 0 and n != 1 && "s" || ""
    b = n == 0 && "no more" || n
    String.capitalize(
      "#{b} bottle#{s} of beer on the wall, #{b} bottle#{s} of beer.\n"
    )
    <>
    calc_next(n - 1)
  end

  defp calc_next(-1) do
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end

  defp calc_next(n) do
    s = (n > 1 or n == 0) && "s" || ""
    one = n == 0 && "it" || "one"
    n = n == 0 && "no more" || n
    "Take #{one} down and pass it around, #{n} bottle#{s} of beer on the wall.\n"
  end

  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(number) do
    generate_beer(number)
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range \\ 99..0) do
   Enum.map_join(range, "\n", &generate_beer/1)
  end
end
