defmodule Grains do
  @doc """
  Calculate two to the power of the input minus one.
  """
  @spec square(pos_integer) :: {atom, pos_integer | String.t()}
  def square(number) when number in 1..64 do
    {:ok, do_square(number - 1)}
  end

  def square(_) do
    {:error, "The requested square must be between 1 and 64 (inclusive)"}
  end

  defp do_square(0), do: 1
  defp do_square(n), do: 2 * do_square(n - 1)

  @doc """
  Adds square of each number from 1 to 64.
  """
  @spec total :: {atom, pos_integer}
  def total do
    grains =
      1..64
      |> Enum.map(&square/1)
      |> Enum.reduce(0, fn {:ok, number}, acc -> number + acc end)

    {:ok, grains}
  end
end
