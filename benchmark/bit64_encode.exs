
encoded = "QV1F895bEO2fOeE4RBmvDKdso03fR8ORlKEhmTJGwww" 
decoded = <<138, 137, 138, 148, 154, 214, 68, 18, 245, 201, 69, 72, 101, 184, 253, 248, 177, 122, 28, 68, 247, 37, 149, 148, 237, 65, 176, 91, 62, 22, 0, 0>>

encoded_list = to_charlist encoded

Benchee.run(%{
  "decode to tail" => (fn ->
    Bit64.decode_bin encoded
  end),
  "encode to tail" => (fn ->
    Bit64.encode_bin decoded
  end),
  # "decode to head" => (fn ->
  #   Bit64.decode_bin_proc1 0, 0, encoded_list, []
  # end),
})