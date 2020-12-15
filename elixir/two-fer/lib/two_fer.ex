defmodule TwoFer do
  @doc """
  Two-fer or 2-fer is short for two for one. One for you and one for me.
  """
  @spec two_fer(String.t()) :: String.t()
  def two_fer(name \\ "you") do
    if not is_binary(name) do
      raise FunctionClauseError, message: "Name must be a binary"
    end
    "One for #{name}, one for me"
  end
end
