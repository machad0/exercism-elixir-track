defmodule Bob do
  def hey(input) do
    cond do 
      shouting_question?(input) -> 
        "Calm down, I know what I'm doing!"
      shouting?(input) ->
        "Whoa, chill out!"
      saying_nothing?(input) ->
        "Fine. Be that way!"
      is_question?(input) ->
        "Sure."
      true ->
        "Whatever."
    end
  end

  defp shouting?(input) do
    String.upcase(input) == input && String.downcase(input) != input
  end

  defp saying_nothing?(input) do
    String.trim(input) == ""
  end

  defp is_question?(input) do
    String.last(input) == "?"
  end

  def shouting_question?(input) do 
   shouting?(input) && is_question?(input)
  end
end

