defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    lower = String.downcase(sentence)
    neutralized = Regex.replace(~r/[^\w- ]/u, lower, "")
    Regex.replace(~r/_/u, neutralized, " ")
    |> String.split
    |> Enum.reduce(%{}, fn word, acc ->
      Map.update(acc, word, 1, &(&1 + 1))
    end)
  end
end
