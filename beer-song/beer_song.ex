defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(number) do
    """
    #{first_verse(number)}
    #{second_verse(number)}
    """
  end

  defp first_verse(0), do: "No more bottles of beer on the wall, no more bottles of beer."
  defp first_verse(number) do
    number_bottles = beer(number) 
    ~s(#{number_bottles} of beer on the wall, #{number_bottles} of beer.)
  end

  defp second_verse(0), do: "Go to the store and buy some more, 99 bottles of beer on the wall."
  defp second_verse(number) do
    number_bottles = beer(number - 1)
    ~s(Take #{which?(number)} down and pass it around, #{number_bottles} of beer on the wall.)
  end

  defp which?(1), do: "it"
  defp which?(_number), do: "one"

  defp beer(1), do: "1 bottle"
  defp beer(0), do: "no more bottles"
  defp beer(number), do: "#{number} bottles"

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  def lyrics(), do: lyrics(99..0)

  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range) do
    verses = for bottle <- range, do: verse(bottle)
    Enum.join(verses, "\n")
  end

end
