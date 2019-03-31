defmodule Base58 do
  @moduledoc """
  Documentation for Base58
  """
  @alphabet ~c(123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ)

  @doc """
  Encodes the given integer.
  """
  def encode(x), do: encode_proc(x, [])

  @doc """
  Decodes the given string.
  """
  def decode(enc), do: decode_proc(enc |> to_charlist, 0)

  defp encode_proc(0, []), do: [@alphabet |> hd] |> to_string
  defp encode_proc(0, acc), do: acc |> to_string
  defp encode_proc(x, acc) do
     encode_proc(div(x, 58), [encode_char(rem(x, 58)) | acc])
  end

  defp decode_proc([], acc), do: acc
  defp decode_proc([c | cs], acc) do
    decode_proc(cs, (acc * 58) + decode_char(c))
  end

  for n <- 0..58 do

    defp encode_char(unquote(n)) do
      unquote(Enum.at(@alphabet, n))
    end

    defp decode_char(unquote(Enum.at(@alphabet, n))) do
      unquote(n)
    end

  end
end
