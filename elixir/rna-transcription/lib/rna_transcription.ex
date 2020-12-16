defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    # I think this is more efficient, i don't know exactly how the garbage
    # collector performs in this situation, but i think this is doing just the
    # same as a single Enum.map, creating a new list each iteration.
    Enum.reduce(dna, [], fn char, accumulator ->
       accumulator ++ do_rna(char)
    end)
  end

  defp do_rna(c) do
    case c do
      ?G -> 'C'
      ?C -> 'G'
      ?T -> 'A'
      ?A -> 'U'
    end
  end
end
