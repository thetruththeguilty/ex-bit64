# list = Enum.to_list(1..10_000)
# map_fun = fn i -> [i, i * i] end

# Benchee.run(%{
#   "flat_map"    => fn -> Enum.flat_map(list, map_fun) end,
#   "map.flatten" => fn -> list |> Enum.map(map_fun) |> List.flatten() end
# })

require Base58

defmodule Base58.BK do
  @moduledoc """
  Documentation for Bit64
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
     encode_proc(div(x, 58), [Enum.at(@alphabet, rem(x, 58)) | acc])
  end

  defp decode_proc([], acc), do: acc
  defp decode_proc([c | cs], acc) do
    decode_proc(cs, (acc * 58) + Enum.find_index(@alphabet, &(&1 == c)))
  end
end

Benchee.run(%{
  "Base58 encode" => (fn ->
    Base58.encode(0)
    Base58.encode(57)
    Base58.encode(1024)
    Base58.encode(123456789)
  end),
  "Base58.BK encode" => (fn ->
    Base58.BK.encode(0)
    Base58.BK.encode(57)
    Base58.BK.encode(1024)
    Base58.BK.encode(123456789)
  end)
})

Benchee.run(%{
  "Base58 decode" => (fn ->
    Base58.decode("1")
    Base58.decode("Z")
    Base58.decode("iE")
    Base58.decode("bUKpk")
  end),
  "Base58.BK decode" => (fn ->
    Base58.BK.decode("1")
    Base58.BK.decode("Z")
    Base58.BK.decode("iE")
    Base58.BK.decode("bUKpk")
  end)
})