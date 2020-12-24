defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @numerals %{
    1000 => "M",
    900 => "CM",
    500 => "D",
    400 => "CD",
    100 => "C",
    90 => "XC",
    50 => "L",
    40 => "XL",
    10 => "X",
    9 => "IX",
    5 => "V",
    4 => "IV",
    1 => "I"
  }

  def numeral(0), do: ""

  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    num = Map.keys(@numerals)
    |> Enum.sort(:desc)
    |> Enum.find(&(&1 <= number))
    Map.get(@numerals, num) <> numeral(number - num)
  end
end
