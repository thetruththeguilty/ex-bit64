# list = Enum.to_list(1..10_000)
# map_fun = fn i -> [i, i * i] end

# Benchee.run(%{
#   "flat_map"    => fn -> Enum.flat_map(list, map_fun) end,
#   "map.flatten" => fn -> list |> Enum.map(map_fun) |> List.flatten() end
# })

require Base58
require Bit64

Benchee.run(%{
  "Base58 encode" => (fn ->
    Base58.encode(0)
    Base58.encode(57)
    Base58.encode(1024)
    Base58.encode(123456789)
  end),
  "Bit64 encode" => (fn ->
    Bit64.encode(0)
    Bit64.encode(57)
    Bit64.encode(1024)
    Bit64.encode(123456789)
  end)
})

Benchee.run(%{
  "Base58 decode" => (fn ->
    Base58.decode("1")
    Base58.decode("Z")
    Base58.decode("iE")
    Base58.decode("bUKpk")
  end),
  "Bit64 decode" => (fn ->
    Bit64.decode("1")
    Bit64.decode("Z")
    Bit64.decode("iE")
    Bit64.decode("bUKpk")
  end)
})