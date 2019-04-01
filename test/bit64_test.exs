defmodule Bit64Test do
  use ExUnit.Case

  test "encode" do
    assert Base58.encode(0) == "1"
    assert Base58.encode(57) == "Z"
    assert Base58.encode(1024) == "iE"
    assert Base58.encode(123456789) == "bUKpk"
  end

  test "decode" do
    assert Base58.decode("1") == 0
    assert Base58.decode("Z") == 57
    assert Base58.decode("iE") == 1024
    assert Base58.decode("bUKpk") == 123456789
  end

  test "bit64 number to char" do
    assert "a" == (Bit64.decode_number!("a") |> Bit64.encode_number)
    assert "b" == (Bit64.decode_number!("b") |> Bit64.encode_number)
    assert "c" == (Bit64.decode_number!("c") |> Bit64.encode_number)
    assert "w" == (Bit64.decode_number!("w") |> Bit64.encode_number)
    assert "W" == (Bit64.decode_number!("W") |> Bit64.encode_number)
    assert "C" == (Bit64.decode_number!("C") |> Bit64.encode_number)
  end

  test "bit64 binary to binary" do
    assert "ac" == (Bit64.encode("ac") |> Bit64.decode!)
    assert "bw" == (Bit64.encode("bw") |> Bit64.decode!)
    assert "cww" == (Bit64.encode("cww") |> Bit64.decode!)
    assert "acc" == (Bit64.encode("acc") |> Bit64.decode!)
    assert "accw" == (Bit64.encode("accw") |> Bit64.decode!)
    assert "accww" == (Bit64.encode("accww") |> Bit64.decode!)
  end
end
