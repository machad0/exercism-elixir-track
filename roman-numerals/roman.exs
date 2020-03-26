defmodule Roman do
  @doc """
  Convert the number to a roman number.

  """
  @spec numerals(pos_integer) :: String.t()
  def numerals(number) do
    convert(number)
  end

  defp convert(number) when number < 1, do: "" 
  defp convert(number) when number >= 1000, do: "M" <> convert(number - 1000)
  defp convert(number) when number >= 900, do: "CM" <> convert(number - 900)
  defp convert(number) when number >= 500, do: "D" <> convert(number - 500)
  defp convert(number) when number >= 400, do: "CD" <> convert(number - 400)
  defp convert(number) when number >= 100, do: "C" <> convert(number - 100)
  defp convert(number) when number >= 90, do: "XC" <> convert(number - 90)
  defp convert(number) when number >= 50, do: "L" <> convert(number - 50)
  defp convert(number) when number >= 40, do: "XL" <> convert(number - 40)
  defp convert(number) when number >= 10, do: "X" <> convert(number - 10)
  defp convert(number) when number >= 9, do: "IX" <> convert(number - 9)
  defp convert(number) when number >= 5, do: "V" <> convert(number - 5)
  defp convert(number) when number >= 4, do: "IV" <> convert(number - 4)
  defp convert(number) when number >= 1, do: "I" <> convert(number - 1)

  end
