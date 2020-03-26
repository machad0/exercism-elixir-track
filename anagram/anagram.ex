defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    for candidate <- candidates, get_anagram(candidate, base), do: candidate
  end

  defp get_anagram(candidate, base) do 
    base_letters = normalize_strings(base)
    candidate_letters = normalize_strings(candidate)
    base_letters == candidate_letters and String.downcase(base) != String.downcase(candidate)
  end
  
  defp normalize_strings(str), do: str |> String.downcase |> String.graphemes |> Enum.sort

end
