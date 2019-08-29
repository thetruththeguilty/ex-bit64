defmodule Bit64 do
  @moduledoc """
  Documentation for Bit64
  """
  @alphabet ~c(wyACEGIKMOQSUWY_02468acegikmoqsuxBFJNRVZ159dhlptzHPX3bjrDT7nLf-v)

  import Bitwise

  @doc """
  Encodes the given integer.
  """
  def encode_number(x) when is_number(x), do: encode_proc(x, <<>>)

  @doc """
  Decodes the given string.
  """
  def decode_number!(enc) when is_binary(enc), do: decode_proc(enc, 0)

  @doc """
  Decodes the given string, return {:ok, result} or :error
  """
  def decode_number(enc) when is_binary(enc) do
    {:ok, decode_proc(enc, 0)}
  rescue
    _err -> {:error, "decode_char error"}
  end

  @doc """
  Encode a binary bytes to bit64 binary/string
  """
  def encode(bytes) when is_binary(bytes) do
    encode_bin_proc(0, 0, bytes, <<>>)
  end

  @doc """
  Decodes a bit64 binary/string, to binary bytes
  """
  def decode!(enc) when is_binary(enc) do
    decode_bin_proc(0, 0, enc, <<>>)
  end

  @doc """
  Decodes a bit64 binary/string, to binary bytes,
  ## Examples
      iex> Bit64.decode "yw"
      {:ok, <<1>>}
      iex> Bit64.decode <<1>>
      :error
  """
  def decode(enc) when is_binary(enc) do
    {:ok, decode_bin_proc(0, 0, enc, <<>>)}
  rescue
    _err -> {:error, "decode_char error"}
  end

  #########################
  ### private functions ###

  # encode from bytes binary to bit64 string binary
  defp encode_bin_proc(take_count, last_take, <<current_take::8, rest::binary>>, acc)
    when take_count < 6 do
    next_take = last_take ||| ( current_take <<< take_count)
    encode_bin_proc(take_count + 8, next_take, rest, acc)
  end

  defp encode_bin_proc(take_count, take, rest, acc)
    when take_count >= 6 do
    current = band(take, 0x3f) # 0x3f is 6 '1' bit 0b111111
    encode_bin_proc(take_count - 6, take >>> 6, rest, acc <> <<encode_char(current)>>)
  end

  defp encode_bin_proc(take_count, take, <<>>, acc) do
    current = band(take, 0x3f)
    next_count = take_count - 6
    if next_count <= 0 do
      acc <> <<encode_char(current)>>
    else
      encode_bin_proc(next_count, take >>> 6, <<>>, acc <> <<encode_char(current)>>)
    end
  end

  # decode from bit64 string binary to bytes binary
  defp decode_bin_proc(take_count, last_take, <<current_take::8, rest::binary>>, acc)
    when take_count < 8 do
    next_take = last_take ||| ( decode_char(current_take) <<< take_count)
    decode_bin_proc(take_count + 6, next_take, rest, acc)
  end

  defp decode_bin_proc(take_count, take, rest, acc)
    when take_count >= 8 do
    current = band take, 0xff
    decode_bin_proc(take_count - 8, take >>> 8, rest, acc <> <<current>>)
  end

  defp decode_bin_proc(take_count, take, <<>>, acc) do
    current = band take, 0xff
    next_count = take_count - 8
    if next_count <= 0 do
      if current > 0, do: acc <> <<current>>, else: acc
    else
      decode_bin_proc(next_count, take >>> 8, <<>>, acc <> <<current>>)
    end
  end

  # def decode_bin_proc1(take_count, last_take, [current_take | rest], acc)
  #   when take_count < 8 do
  #   next_take = last_take ||| ( decode_char(current_take) <<< take_count)
  #   decode_bin_proc1(take_count + 6, next_take, rest, acc)
  # end

  # def decode_bin_proc1(take_count, take, rest, acc)
  #   when take_count >= 8 do
  #   current = band take, 0xff
  #   decode_bin_proc1(take_count - 8, take >>> 8, rest, [current | acc])
  # end

  # def decode_bin_proc1(take_count, take, [], acc) do
  #   current = band take, 0xff
  #   next_count = take_count - 8
  #   if next_count <= 0 do
  #     if current > 0, do: [current | acc], else: acc
  #   else
  #     decode_bin_proc1(next_count, take >>> 8, [], [current | acc])
  #   end
  # end


  # encode and decode on one number

  defp encode_proc(0, <<>>), do: <<encode_char(0)>> <> <<>>
  defp encode_proc(0, acc), do: acc
  defp encode_proc(x, acc) do
    encode_proc(div(x, 64), <<encode_char(rem(x, 64))>> <> acc)
  end

  defp decode_proc(<<>>, acc), do: acc
  defp decode_proc(<<c::8, cs::binary>>, acc) do
    decode_proc(cs, (acc * 64) + decode_char(c))
  end

  for n <- 0..64 do

    defp encode_char(unquote(n)) do
      unquote(Enum.at(@alphabet, n))
    end

    defp decode_char(unquote(Enum.at(@alphabet, n))) do
      unquote(n)
    end

  end
end
