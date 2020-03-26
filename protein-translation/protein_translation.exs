defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  
@codon_protein %{
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
  "UGA" => "STOP"
}

  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    codons = rna |> String.graphemes |> Enum.chunk_every(3) |> Enum.map(&Enum.join/1)
    case fetch_protein(codons) do
      {:error, invalid} ->  {:error, invalid}
      proteins -> {:ok, proteins}
    end
  end

  defp fetch_protein([], last_protein), do: last_protein
  defp fetch_protein([codon | tail], last_protein \\ []) do
    case Map.fetch(@codon_protein, codon) do
      {:ok, "STOP"} -> last_protein
      {:ok, protein} -> fetch_protein(tail, last_protein ++ [protein]) 
      :error -> {:error, "invalid RNA"}
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
    case Map.fetch(@codon_protein, codon) do
      :error -> {:error, "invalid codon"} 
      ok_protein -> ok_protein
    end
  end

end
