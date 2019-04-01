
encoded = "QV1F895bEO2fOeE4RBmvDKdso03fR8ORlKEhmTJGwww" 
decoded = <<138, 137, 138, 148, 154, 214, 68, 18, 245, 201, 69, 72, 101, 184, 253, 248, 177, 122, 28, 68, 247, 37, 149, 148, 237, 65, 176, 91, 62, 22, 0, 0>>

encoded64 = "iomKlJrWRBL1yUVIZbj9+LF6HET3JZWU7UGwWz4WAAA="

# encoded_list = to_charlist encoded

Benchee.run(%{
  "decode bit64" => (fn ->
    Bit64.decode! encoded
  end),
  "encode bit64" => (fn ->
    Bit64.encode decoded
  end),
  "decode with base64" => (fn ->
    Base.decode64! encoded64
  end),
  "encode with base64" => (fn ->
    Base.encode64 encoded64
  end),
  # "decode to head" => (fn ->
  #   Bit64.decode_bin_proc1 0, 0, encoded_list, []
  # end),
})