defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase
    |> String.replace("_", " ")
    |> String.replace(",", "")
    |> String.replace(~r/[,.:"@£$%^&*!]/, "")
    |> String.split(" ", trim: true)
    |> Enum.reduce(%{}, fn str, acc -> Map.update(acc, str, 1, &(&1 + 1)) end)
  end
end
