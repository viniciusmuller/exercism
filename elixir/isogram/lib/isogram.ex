defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t()) :: boolean
  def isogram?(sentence) do
    sent = Regex.replace(~r/[ -]/, sentence, "")
    sent
    |> String.to_charlist()
    |> Enum.uniq()
    |> length == String.length(sent)
  end
end
