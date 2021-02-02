defmodule CollatzConjecture do
  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  def calc(input) when input <= 0, do: raise FunctionClauseError
  def calc(input), do: calc(input, 0)

  def calc(1, steps), do: steps

  def calc(input, steps) when rem(input, 2) == 0 do
    calc(div(input, 2), steps + 1)
  end

  def calc(input, steps) when rem(input, 2) == 1 do
    calc(input * 3 + 1, steps + 1)
  end
end
