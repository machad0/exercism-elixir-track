defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  use Bitwise
  @instructions %{
    1 => "wink",
    2 => "double blink",
    4 => "close your eyes",
    8 => "jump"
  }
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    instructions = Map.keys(@instructions)
    instructions
    |> Enum.map(&(translate(&1, code)))
    |> Enum.reject(&Kernel.is_nil/1)
    |> reverse?(code)
  end

  defp reverse?(instructions, code) do 
    case code &&& 16 do
      0 -> instructions
      _ -> Enum.reverse(instructions)
    end
  end

  defp translate(instruction, code) do
    case Map.fetch(@instructions, code &&& instruction) do
      {:ok, action} -> action
      :error -> nil
    end
  end


end
