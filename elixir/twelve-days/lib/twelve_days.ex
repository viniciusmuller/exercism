defmodule TwelveDays do

  @days %{
    1 => [day: "first", item: "and a Partridge in a Pear Tree."],
    2 => [day: "second", item: "two Turtle Doves"],
    3 => [day: "third", item: "three French Hens"],
    4 => [day: "fourth", item: "four Calling Birds"],
    5 => [day: "fifth", item: "five Gold Rings"],
    6 => [day: "sixth", item: "six Geese-a-Laying"],
    7 => [day: "seventh", item: "seven Swans-a-Swimming"],
    8 => [day: "eighth", item: "eight Maids-a-Milking"],
    9 => [day: "ninth", item: "nine Ladies Dancing"],
    10 => [day: "tenth", item: "ten Lords-a-Leaping"],
    11 => [day: "eleventh", item: "eleven Pipers Piping"],
    12 => [day: "twelfth", item: "twelve Drummers Drumming"]
  }

  def verse(1) do
    "On the first day of Christmas my true love gave to me:" <>
    " a Partridge in a Pear Tree."
  end

  @doc """
  Given a `number`, return the song's verse for that specific day, including
  all gifts for previous days in the same line.
  """
  @spec verse(number :: integer) :: String.t()
  def verse(number) do
    day = @days |> Map.get(number) |> Keyword.get(:day)
    items =
      number..1
      |> Enum.map_join(", ", &(
           @days |> Map.get(&1) |> Keyword.get(:item)
         ))
    "On the #{day} day of Christmas my true love gave to me: #{items}"
  end

  @doc """
  Given a `starting_verse` and an `ending_verse`, return the verses for each
  included day, one per line.
  """
  @spec verses(starting_verse :: integer, ending_verse :: integer) :: String.t()
  def verses(starting_verse, ending_verse) do
    starting_verse..ending_verse
    |> Enum.map_join("\n", &verse/1)
  end

  @doc """
  Sing all 12 verses, in order, one verse per line.
  """
  @spec sing() :: String.t()
  def sing, do: verses(1, 12)
end
