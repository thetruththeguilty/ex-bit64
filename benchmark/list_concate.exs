
Benchee.run(%{
  "add to tail 1" => (fn ->
    Enum.concat 'abcdefghijklmnopqrstuvwxyz', 'b'
  end),
  "add to head 1" => (fn ->
    [97 | 'abcdefghijklmnopqrstuvwxyz']
  end)
})