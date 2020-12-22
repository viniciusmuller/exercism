defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    lower = String.downcase(sentence)
    # Removing punctuation
    Regex.replace(~r/:punct:/u, lower, "")
    # Splitting with Regex
    |> String.split(~r/\s_/)
    |> Enum.reduce(%{}, fn word, acc ->
      Map.update(acc, word, 1, &(&1 + 1))
    end)
  end
end
