defmodule Bob do
  def hey(input) do
    input = String.trim(input)
    cond do
      question?(input) and shout?(input) -> "Calm down, I know what I'm doing!"
      shout?(input) -> "Whoa, chill out!"
      question?(input) -> "Sure."
      silence?(input) -> "Fine. Be that way!"
      true -> "Whatever."
    end
  end

  defp silence?(input), do: input == ""

  defp question?(input), do: String.ends_with?(input, "?")

  defp shout?(input) do
    String.upcase(input) == input
    and String.downcase(input) != input
  end
end
