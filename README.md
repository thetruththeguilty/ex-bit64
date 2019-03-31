# Bit64

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `bit64` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:bit64, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/bit64](https://hexdocs.pm/bit64).



## Benchmark

compare with base64
```txt
Operating System: macOS
CPU Information: Intel(R) Core(TM) i7-8850H CPU @ 2.60GHz
Number of Available Cores: 12
Available memory: 16 GB
Elixir 1.8.1
Erlang 21.2.7

Benchmark suite executing with the following configuration:
warmup: 2 s
time: 5 s
memory time: 0 ns
parallel: 1
inputs: none specified
Estimated total run time: 28 s

Benchmarking decode bit64...
Benchmarking decode with base64...
Benchmarking encode bit64...
Benchmarking encode with base64...

Name                         ips        average  deviation         median         99th %
decode with base64      720.15 K        1.39 μs  ±2195.93%           1 μs           3 μs
encode with base64      663.48 K        1.51 μs  ±2012.30%           1 μs           3 μs
decode bit64            245.22 K        4.08 μs   ±485.04%           4 μs           7 μs
encode bit64            226.91 K        4.41 μs   ±324.40%           4 μs           9 μs

Comparison: 
decode with base64      720.15 K
encode with base64      663.48 K - 1.09x slower +0.119 μs
decode bit64            245.22 K - 2.94x slower +2.69 μs
encode bit64            226.91 K - 3.17x slower +3.02 μs
```

compare with base58
```txt
Operating System: macOS
CPU Information: Intel(R) Core(TM) i7-8850H CPU @ 2.60GHz
Number of Available Cores: 12
Available memory: 16 GB
Elixir 1.8.1
Erlang 21.2.7

Benchmark suite executing with the following configuration:
warmup: 2 s
time: 5 s
memory time: 0 ns
parallel: 1
inputs: none specified
Estimated total run time: 14 s

Benchmarking Base58 encode...
Benchmarking Base58.BK encode...

Name                       ips        average  deviation         median         99th %
Base58 encode         712.61 K        1.40 μs  ±2994.24%           1 μs           2 μs
Base58.BK encode      215.80 K        4.63 μs   ±584.37%           4 μs           7 μs

Comparison: 
Base58 encode         712.61 K
Base58.BK encode      215.80 K - 3.30x slower +3.23 μs

Operating System: macOS
CPU Information: Intel(R) Core(TM) i7-8850H CPU @ 2.60GHz
Number of Available Cores: 12
Available memory: 16 GB
Elixir 1.8.1
Erlang 21.2.7

Benchmark suite executing with the following configuration:
warmup: 2 s
time: 5 s
memory time: 0 ns
parallel: 1
inputs: none specified
Estimated total run time: 14 s

Benchmarking Base58 decode...
Benchmarking Base58.BK decode...

Name                       ips        average  deviation         median         99th %
Base58 decode           1.24 M        0.80 μs  ±1572.25%           1 μs           1 μs
Base58.BK decode       0.148 M        6.78 μs   ±203.24%           6 μs          11 μs

Comparison: 
Base58 decode           1.24 M
Base58.BK decode       0.148 M - 8.42x slower +5.97 μs
```