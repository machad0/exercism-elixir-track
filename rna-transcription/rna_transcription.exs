defmodule RNATranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    rna_transcription = %{
      ?G => ?C,
      ?C => ?G,
      ?T => ?A, 
      ?A => ?U
    }

    dna 
    |> Enum.map(&(rna_transcription[&1]))
  end
end
