
Benchee.run(%{
  "add to tail 1" => (fn ->
    "abcdefghijklmnopqrstuvwxyz" <> "ab"
    "abcdefghijklmnopqrstuvwxyz" <> <<0>>
  end),
  "add to tail 2" => (fn ->
    << "abcdefghijklmnopqrstuvwxyz", "ab" >>
    << "abcdefghijklmnopqrstuvwxyz", <<0>> >>
  end),
  "add to head 1" => (fn ->
    "ab" <> "abcdefghijklmnopqrstuvwxyz"
    <<0>> <> "abcdefghijklmnopqrstuvwxyz"
  end),
  "add to head 2" => (fn ->
    << "ab" , "abcdefghijklmnopqrstuvwxyz" >>
    << <<0>> , "abcdefghijklmnopqrstuvwxyz" >>
  end)
})