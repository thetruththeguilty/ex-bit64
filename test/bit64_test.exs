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
    assert "a" == (Bit64.decode!("a") |> Bit64.encode)
    assert "b" == (Bit64.decode!("b") |> Bit64.encode)
    assert "c" == (Bit64.decode!("c") |> Bit64.encode)
    assert "w" == (Bit64.decode!("w") |> Bit64.encode)
    assert "W" == (Bit64.decode!("W") |> Bit64.encode)
    assert "C" == (Bit64.decode!("C") |> Bit64.encode)
  end

  test "bit64 binary to binary" do
    assert "ac" == (Bit64.encode_bin("ac") |> Bit64.decode_bin!)
    assert "bw" == (Bit64.encode_bin("bw") |> Bit64.decode_bin!)
    assert "cww" == (Bit64.encode_bin("cww") |> Bit64.decode_bin!)
    assert "acc" == (Bit64.encode_bin("acc") |> Bit64.decode_bin!)
    assert "accw" == (Bit64.encode_bin("accw") |> Bit64.decode_bin!)
    assert "accww" == (Bit64.encode_bin("accww") |> Bit64.decode_bin!)
  end
end
