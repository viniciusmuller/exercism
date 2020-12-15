defmodule ProteinTranslation do

  @codons %{
    "UGU" => "Cysteine",
    "UGC" => "Cysteine",
    "UUA" => "Leucine",
    "UUG" => "Leucine",
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine",
    "UUC" => "Phenylalanine",
    "UCU" => "Serine",
    "UCC" => "Serine",
    "UCA" => "Serine",
    "UCG" => "Serine",
    "UGG" => "Tryptophan",
    "UAU" => "Tyrosine",
    "UAC" => "Tyrosine",
    "UAA" => "STOP",
    "UAG" => "STOP",
    "UGA" => "STOP",
  }

  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    # Chunk RNA proteins into groups of three and pass them to of_codon/1.
    proteins = rna
      |> String.codepoints
      |> Enum.chunk_every(3)
      |> Enum.map(&of_codon/1)
    # If any codon is invalid, the RNA is invalid.
    if Enum.member?(proteins, {:error, "invalid codon"}) do
      {:error, "invalid RNA"}
    else
      # Select protein values and select them while "STOP" value is not found.
      result = proteins
      |> Enum.map(fn {_, protein} -> protein end)
      |> Enum.take_while(fn x -> x != "STOP" end)
      {:ok, result}
    end
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
    protein = Map.get(@codons, to_string(codon))
    cond do
      protein -> {:ok, protein}
      true    -> {:error, "invalid codon"}
    end
  end
end
