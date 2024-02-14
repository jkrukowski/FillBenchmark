# FillBenchmark

Comparison of different approaches to filling a `MLMultiArray` with values for given indexes.

* `fill` - fills the array with a single value for given indexes
* `concurrentFill` - uses `DispatchQueue.concurrentPerform` to do the same
* `standaloneFill` - fills the array with a single value for given indexes, precomputing the strides first
* `helperFill` - fills the array with a single value for given indexes, precomputing the strides first using a helper function

## Usage

To run Google Benchmark:

```
$ swift run -c release
```

To run XCTest Benchmark:

```
$ swift test -c release 2>&1 | xcbeautify
```

## Results

MacBook Air M1 2020, 16GB RAM

Google Benchmark results (1000 iterations)

```
name                                             time            std         iterations
---------------------------------------------------------------------------------------
fill10.count=100, indexes=10                         3666.000 ns ±  12.24 %        1000
fill10.count=1_000, indexes=10                       3709.000 ns ±   4.47 %        1000
fill10.count=10_000, indexes=10                      3875.000 ns ±  36.15 %        1000
fill10.count=100_000, indexes=10                     3792.000 ns ±  18.19 %        1000
fill100.count=100, indexes=100                      36417.000 ns ±  58.44 %        1000
fill100.count=1_000, indexes=100                    38250.000 ns ± 1529.74 %       1000
fill100.count=10_000, indexes=100                   38375.000 ns ± 114.43 %        1000
fill100.count=100_000, indexes=100                  37834.000 ns ±  33.49 %        1000
fillAll.count=100, indexes=100                      37833.000 ns ±  36.02 %        1000
fillAll.count=1_000, indexes=1_000                 363333.000 ns ±   9.94 %        1000
fillAll.count=10_000, indexes=10_000              3645479.500 ns ±  28.61 %        1000
fillAll.count=100_000, indexes=100_000           35916083.000 ns ±   4.10 %        1000
concurrentFill10.count=100, indexes=10               4583.000 ns ± 136.52 %        1000
concurrentFill10.count=1_000, indexes=10             4583.000 ns ±  12.39 %        1000
concurrentFill10.count=10_000, indexes=10            4583.000 ns ±  58.29 %        1000
concurrentFill10.count=100_000, indexes=10           4416.000 ns ± 105.56 %        1000
concurrentFill100.count=100, indexes=100            34416.500 ns ±  50.75 %        1000
concurrentFill100.count=1_000, indexes=100          38063.000 ns ±  53.62 %        1000
concurrentFill100.count=10_000, indexes=100         51521.000 ns ±  38.03 %        1000
concurrentFill100.count=100_000, indexes=100        39584.000 ns ±  43.13 %        1000
concurrentFillAll.count=100, indexes=100            33083.500 ns ±  46.62 %        1000
concurrentFillAll.count=1_000, indexes=1_000       422292.000 ns ±  15.71 %        1000
concurrentFillAll.count=10_000, indexes=10_000    4404937.500 ns ±  18.71 %        1000
concurrentFillAll.count=100_000, indexes=100_000 45759625.000 ns ±  15.62 %        1000
standaloneFill10.count=100, indexes=10               2542.000 ns ±  33.10 %        1000
standaloneFill10.count=1_000, indexes=10             1000.000 ns ±   4.68 %        1000
standaloneFill10.count=10_000, indexes=10            1000.000 ns ±  22.97 %        1000
standaloneFill10.count=100_000, indexes=10           1000.000 ns ±  22.36 %        1000
standaloneFill100.count=100, indexes=100             6667.000 ns ±  31.41 %        1000
standaloneFill100.count=1_000, indexes=100           6708.000 ns ±   3.21 %        1000
standaloneFill100.count=10_000, indexes=100          6833.000 ns ±  12.81 %        1000
standaloneFill100.count=100_000, indexes=100         6875.000 ns ±  47.74 %        1000
standaloneFillAll.count=100, indexes=100             6875.000 ns ±  28.09 %        1000
standaloneFillAll.count=1_000, indexes=1_000        65583.000 ns ±  69.42 %        1000
standaloneFillAll.count=10_000, indexes=10_000     644187.500 ns ±  31.44 %        1000
standaloneFillAll.count=100_000, indexes=100_000  6183000.000 ns ±   7.45 %        1000
helperFill10.count=100, indexes=10                   1000.000 ns ±  69.71 %        1000
helperFill10.count=1_000, indexes=10                 1000.000 ns ±  24.15 %        1000
helperFill10.count=10_000, indexes=10                1000.000 ns ±   5.47 %        1000
helperFill10.count=100_000, indexes=10               1041.000 ns ±  43.14 %        1000
helperFill100.count=100, indexes=100                 6667.000 ns ±  33.07 %        1000
helperFill100.count=1_000, indexes=100               6625.000 ns ±   8.99 %        1000
helperFill100.count=10_000, indexes=100              6584.000 ns ±  19.16 %        1000
helperFill100.count=100_000, indexes=100             6584.000 ns ±   9.99 %        1000
helperFillAll.count=100, indexes=100                 6500.000 ns ±   8.03 %        1000
helperFillAll.count=1_000, indexes=1_000            61875.000 ns ±   3.53 %        1000
helperFillAll.count=10_000, indexes=10_000         614708.000 ns ±  11.47 %        1000
helperFillAll.count=100_000, indexes=100_000      6140499.500 ns ±   1.92 %        1000
```

XCTests results (1000 iterations)

```
TestConcurrentFill
    ◷ testConcurrentFill100_100 measured (3116.078 kI ±1.548% -- CPU Instructions Retired)
    ◷ testConcurrentFill100_100 measured (907.943 kC ±11.173% -- CPU Cycles)
    ◷ testConcurrentFill100_100 measured (0.000 s ±13.732% -- CPU Time)
    ◷ testConcurrentFill100_100 measured (0.000 s ±28.011% -- Clock Monotonic Time)
    ✔ testConcurrentFill100_100 (0.739 seconds)
    ◷ testConcurrentFill100_1000 measured (3120.091 kI ±1.526% -- CPU Instructions Retired)
    ◷ testConcurrentFill100_1000 measured (903.876 kC ±12.150% -- CPU Cycles)
    ◷ testConcurrentFill100_1000 measured (0.000 s ±15.409% -- CPU Time)
    ◷ testConcurrentFill100_1000 measured (0.000 s ±29.865% -- Clock Monotonic Time)
    ✔ testConcurrentFill100_1000 (0.683 seconds)
    ◷ testConcurrentFill100_10000 measured (3125.859 kI ±1.919% -- CPU Instructions Retired)
    ◷ testConcurrentFill100_10000 measured (924.677 kC ±15.843% -- CPU Cycles)
    ◷ testConcurrentFill100_10000 measured (0.000 s ±20.147% -- CPU Time)
    ◷ testConcurrentFill100_10000 measured (0.000 s ±36.894% -- Clock Monotonic Time)
    ✔ testConcurrentFill100_10000 (0.684 seconds)
    ◷ testConcurrentFill100_100000 measured (3122.518 kI ±1.356% -- CPU Instructions Retired)
    ◷ testConcurrentFill100_100000 measured (902.294 kC ±11.940% -- CPU Cycles)
    ◷ testConcurrentFill100_100000 measured (0.000 s ±14.818% -- CPU Time)
    ◷ testConcurrentFill100_100000 measured (0.000 s ±28.078% -- Clock Monotonic Time)
    ✔ testConcurrentFill100_100000 (0.724 seconds)
    ◷ testConcurrentFill10_100 measured (2530.796 kI ±1.757% -- CPU Instructions Retired)
    ◷ testConcurrentFill10_100 measured (682.300 kC ±8.918% -- CPU Cycles)
    ◷ testConcurrentFill10_100 measured (0.000 s ±11.275% -- CPU Time)
    ◷ testConcurrentFill10_100 measured (0.000 s ±42.298% -- Clock Monotonic Time)
    ✔ testConcurrentFill10_100 (0.668 seconds)
    ◷ testConcurrentFill10_1000 measured (2608.688 kI ±7.159% -- CPU Instructions Retired)
    ◷ testConcurrentFill10_1000 measured (771.518 kC ±23.698% -- CPU Cycles)
    ◷ testConcurrentFill10_1000 measured (0.000 s ±34.755% -- CPU Time)
    ◷ testConcurrentFill10_1000 measured (0.000 s ±118.671% -- Clock Monotonic Time)
    ✔ testConcurrentFill10_1000 (0.761 seconds)
    ◷ testConcurrentFill10_10000 measured (2535.115 kI ±1.696% -- CPU Instructions Retired)
    ◷ testConcurrentFill10_10000 measured (682.831 kC ±9.214% -- CPU Cycles)
    ◷ testConcurrentFill10_10000 measured (0.000 s ±12.082% -- CPU Time)
    ◷ testConcurrentFill10_10000 measured (0.000 s ±42.529% -- Clock Monotonic Time)
    ✔ testConcurrentFill10_10000 (0.672 seconds)
    ◷ testConcurrentFill10_100000 measured (2533.000 kI ±1.769% -- CPU Instructions Retired)
    ◷ testConcurrentFill10_100000 measured (670.897 kC ±6.918% -- CPU Cycles)
    ◷ testConcurrentFill10_100000 measured (0.000 s ±8.617% -- CPU Time)
    ◷ testConcurrentFill10_100000 measured (0.000 s ±31.420% -- Clock Monotonic Time)
    ✔ testConcurrentFill10_100000 (0.709 seconds)
    ◷ testConcurrentFillAll_100 measured (3163.873 kI ±4.060% -- CPU Instructions Retired)
    ◷ testConcurrentFillAll_100 measured (943.071 kC ±17.754% -- CPU Cycles)
    ◷ testConcurrentFillAll_100 measured (0.000 s ±23.508% -- CPU Time)
    ◷ testConcurrentFillAll_100 measured (0.000 s ±46.065% -- Clock Monotonic Time)
    ✔ testConcurrentFillAll_100 (0.695 seconds)
    ◷ testConcurrentFillAll_1000 measured (10118.077 kI ±3.652% -- CPU Instructions Retired)
    ◷ testConcurrentFillAll_1000 measured (6399.494 kC ±18.523% -- CPU Cycles)
    ◷ testConcurrentFillAll_1000 measured (0.002 s ±21.976% -- CPU Time)
    ◷ testConcurrentFillAll_1000 measured (0.000 s ±20.956% -- Clock Monotonic Time)
    ✔ testConcurrentFillAll_1000 (1.127 seconds)
    ◷ testConcurrentFillAll_10000 measured (80885.499 kI ±3.793% -- CPU Instructions Retired)
    ◷ testConcurrentFillAll_10000 measured (62615.369 kC ±14.530% -- CPU Cycles)
    ◷ testConcurrentFillAll_10000 measured (0.023 s ±16.580% -- CPU Time)
    ◷ testConcurrentFillAll_10000 measured (0.004 s ±15.116% -- Clock Monotonic Time)
    ✔ testConcurrentFillAll_10000 (5.165 seconds)
    ◷ testConcurrentFillAll_100000 measured (813297.890 kI ±6.592% -- CPU Instructions Retired)
    ◷ testConcurrentFillAll_100000 measured (765455.811 kC ±25.797% -- CPU Cycles)
    ◷ testConcurrentFillAll_100000 measured (0.296 s ±27.754% -- CPU Time)
    ◷ testConcurrentFillAll_100000 measured (0.057 s ±26.714% -- Clock Monotonic Time)
    ✔ testConcurrentFillAll_100000 (61.303 seconds)

TestFill
    ◷ testFill100_100 measured (3035.210 kI ±6.279% -- CPU Instructions Retired)
    ◷ testFill100_100 measured (786.709 kC ±9.724% -- CPU Cycles)
    ◷ testFill100_100 measured (0.000 s ±14.467% -- CPU Time)
    ◷ testFill100_100 measured (0.000 s ±25.283% -- Clock Monotonic Time)
    ✔ testFill100_100 (0.745 seconds)
    ◷ testFill100_1000 measured (2988.426 kI ±4.187% -- CPU Instructions Retired)
    ◷ testFill100_1000 measured (798.362 kC ±12.996% -- CPU Cycles)
    ◷ testFill100_1000 measured (0.000 s ±20.025% -- CPU Time)
    ◷ testFill100_1000 measured (0.000 s ±79.197% -- Clock Monotonic Time)
    ✔ testFill100_1000 (0.746 seconds)
    ◷ testFill100_10000 measured (2970.720 kI ±2.613% -- CPU Instructions Retired)
    ◷ testFill100_10000 measured (785.692 kC ±13.935% -- CPU Cycles)
    ◷ testFill100_10000 measured (0.000 s ±23.706% -- CPU Time)
    ◷ testFill100_10000 measured (0.000 s ±45.413% -- Clock Monotonic Time)
    ✔ testFill100_10000 (0.767 seconds)
    ◷ testFill100_100000 measured (3003.764 kI ±5.029% -- CPU Instructions Retired)
    ◷ testFill100_100000 measured (772.358 kC ±5.936% -- CPU Cycles)
    ◷ testFill100_100000 measured (0.000 s ±7.572% -- CPU Time)
    ◷ testFill100_100000 measured (0.000 s ±17.036% -- Clock Monotonic Time)
    ✔ testFill100_100000 (0.762 seconds)
    ◷ testFill10_100 measured (2536.889 kI ±7.924% -- CPU Instructions Retired)
    ◷ testFill10_100 measured (724.988 kC ±22.092% -- CPU Cycles)
    ◷ testFill10_100 measured (0.000 s ±34.377% -- CPU Time)
    ◷ testFill10_100 measured (0.000 s ±95.875% -- Clock Monotonic Time)
    ✔ testFill10_100 (0.752 seconds)
    ◷ testFill10_1000 measured (2454.338 kI ±2.603% -- CPU Instructions Retired)
    ◷ testFill10_1000 measured (666.531 kC ±15.102% -- CPU Cycles)
    ◷ testFill10_1000 measured (0.000 s ±21.900% -- CPU Time)
    ◷ testFill10_1000 measured (0.000 s ±75.239% -- Clock Monotonic Time)
    ✔ testFill10_1000 (0.720 seconds)
    ◷ testFill10_10000 measured (2443.430 kI ±0.929% -- CPU Instructions Retired)
    ◷ testFill10_10000 measured (635.263 kC ±5.756% -- CPU Cycles)
    ◷ testFill10_10000 measured (0.000 s ±6.768% -- CPU Time)
    ◷ testFill10_10000 measured (0.000 s ±33.526% -- Clock Monotonic Time)
    ✔ testFill10_10000 (0.666 seconds)
    ◷ testFill10_100000 measured (2451.599 kI ±2.626% -- CPU Instructions Retired)
    ◷ testFill10_100000 measured (635.891 kC ±5.634% -- CPU Cycles)
    ◷ testFill10_100000 measured (0.000 s ±6.990% -- CPU Time)
    ◷ testFill10_100000 measured (0.000 s ±26.661% -- Clock Monotonic Time)
    ✔ testFill10_100000 (0.705 seconds)
    ◷ testFillAll_100 measured (2951.475 kI ±2.383% -- CPU Instructions Retired)
    ◷ testFillAll_100 measured (737.421 kC ±5.801% -- CPU Cycles)
    ◷ testFillAll_100 measured (0.000 s ±7.441% -- CPU Time)
    ◷ testFillAll_100 measured (0.000 s ±16.659% -- Clock Monotonic Time)
    ✔ testFillAll_100 (0.700 seconds)
    ◷ testFillAll_1000 measured (8098.723 kI ±2.806% -- CPU Instructions Retired)
    ◷ testFillAll_1000 measured (1789.560 kC ±3.297% -- CPU Cycles)
    ◷ testFillAll_1000 measured (0.001 s ±4.108% -- CPU Time)
    ◷ testFillAll_1000 measured (0.000 s ±5.639% -- Clock Monotonic Time)
    ✔ testFillAll_1000 (1.104 seconds)
    ◷ testFillAll_10000 measured (58611.835 kI ±1.783% -- CPU Instructions Retired)
    ◷ testFillAll_10000 measured (12778.438 kC ±16.564% -- CPU Cycles)
    ◷ testFillAll_10000 measured (0.004 s ±31.521% -- CPU Time)
    ◷ testFillAll_10000 measured (0.004 s ±34.302% -- Clock Monotonic Time)
    ✔ testFillAll_10000 (5.100 seconds)
    ◷ testFillAll_100000 measured (562712.020 kI ±1.482% -- CPU Instructions Retired)
    ◷ testFillAll_100000 measured (121631.192 kC ±10.801% -- CPU Cycles)
    ◷ testFillAll_100000 measured (0.042 s ±19.490% -- CPU Time)
    ◷ testFillAll_100000 measured (0.043 s ±25.752% -- Clock Monotonic Time)
    ✔ testFillAll_100000 (44.690 seconds)

TestFillStandalone
    ◷ testFillStandalone100_100 measured (2460.707 kI ±0.712% -- CPU Instructions Retired)
    ◷ testFillStandalone100_100 measured (604.387 kC ±11.381% -- CPU Cycles)
    ◷ testFillStandalone100_100 measured (0.000 s ±17.368% -- CPU Time)
    ◷ testFillStandalone100_100 measured (0.000 s ±55.230% -- Clock Monotonic Time)
    ✔ testFillStandalone100_100 (0.674 seconds)
    ◷ testFillStandalone100_1000 measured (2477.732 kI ±2.007% -- CPU Instructions Retired)
    ◷ testFillStandalone100_1000 measured (632.965 kC ±13.237% -- CPU Cycles)
    ◷ testFillStandalone100_1000 measured (0.000 s ±19.820% -- CPU Time)
    ◷ testFillStandalone100_1000 measured (0.000 s ±83.677% -- Clock Monotonic Time)
    ✔ testFillStandalone100_1000 (0.684 seconds)
    ◷ testFillStandalone100_10000 measured (2468.275 kI ±1.226% -- CPU Instructions Retired)
    ◷ testFillStandalone100_10000 measured (621.948 kC ±7.924% -- CPU Cycles)
    ◷ testFillStandalone100_10000 measured (0.000 s ±9.126% -- CPU Time)
    ◷ testFillStandalone100_10000 measured (0.000 s ±31.473% -- Clock Monotonic Time)
    ✔ testFillStandalone100_10000 (0.703 seconds)
    ◷ testFillStandalone100_100000 measured (2462.162 kI ±0.420% -- CPU Instructions Retired)
    ◷ testFillStandalone100_100000 measured (602.045 kC ±3.915% -- CPU Cycles)
    ◷ testFillStandalone100_100000 measured (0.000 s ±4.050% -- CPU Time)
    ◷ testFillStandalone100_100000 measured (0.000 s ±8.338% -- Clock Monotonic Time)
    ✔ testFillStandalone100_100000 (0.715 seconds)
    ◷ testFillStandalone10_100 measured (2386.823 kI ±1.812% -- CPU Instructions Retired)
    ◷ testFillStandalone10_100 measured (590.591 kC ±6.424% -- CPU Cycles)
    ◷ testFillStandalone10_100 measured (0.000 s ±7.901% -- CPU Time)
    ◷ testFillStandalone10_100 measured (0.000 s ±64.841% -- Clock Monotonic Time)
    ✔ testFillStandalone10_100 (0.663 seconds)
    ◷ testFillStandalone10_1000 measured (2387.372 kI ±1.166% -- CPU Instructions Retired)
    ◷ testFillStandalone10_1000 measured (601.269 kC ±6.296% -- CPU Cycles)
    ◷ testFillStandalone10_1000 measured (0.000 s ±7.583% -- CPU Time)
    ◷ testFillStandalone10_1000 measured (0.000 s ±79.608% -- Clock Monotonic Time)
    ✔ testFillStandalone10_1000 (0.679 seconds)
    ◷ testFillStandalone10_10000 measured (2384.480 kI ±0.923% -- CPU Instructions Retired)
    ◷ testFillStandalone10_10000 measured (590.887 kC ±5.576% -- CPU Cycles)
    ◷ testFillStandalone10_10000 measured (0.000 s ±6.767% -- CPU Time)
    ◷ testFillStandalone10_10000 measured (0.000 s ±76.333% -- Clock Monotonic Time)
    ✔ testFillStandalone10_10000 (0.673 seconds)
    ◷ testFillStandalone10_100000 measured (2401.245 kI ±4.521% -- CPU Instructions Retired)
    ◷ testFillStandalone10_100000 measured (600.626 kC ±7.055% -- CPU Cycles)
    ◷ testFillStandalone10_100000 measured (0.000 s ±8.050% -- CPU Time)
    ◷ testFillStandalone10_100000 measured (0.000 s ±96.193% -- Clock Monotonic Time)
    ✔ testFillStandalone10_100000 (0.719 seconds)
    ◷ testFillStandaloneAll_100 measured (2467.006 kI ±1.400% -- CPU Instructions Retired)
    ◷ testFillStandaloneAll_100 measured (606.436 kC ±6.699% -- CPU Cycles)
    ◷ testFillStandaloneAll_100 measured (0.000 s ±8.179% -- CPU Time)
    ◷ testFillStandaloneAll_100 measured (0.000 s ±35.767% -- Clock Monotonic Time)
    ✔ testFillStandaloneAll_100 (0.675 seconds)
    ◷ testFillStandaloneAll_1000 measured (3361.061 kI ±4.011% -- CPU Instructions Retired)
    ◷ testFillStandaloneAll_1000 measured (786.415 kC ±6.334% -- CPU Cycles)
    ◷ testFillStandaloneAll_1000 measured (0.000 s ±7.489% -- CPU Time)
    ◷ testFillStandaloneAll_1000 measured (0.000 s ±4.808% -- Clock Monotonic Time)
    ✔ testFillStandaloneAll_1000 (0.726 seconds)
    ◷ testFillStandaloneAll_10000 measured (11999.134 kI ±0.608% -- CPU Instructions Retired)
    ◷ testFillStandaloneAll_10000 measured (2596.099 kC ±8.153% -- CPU Cycles)
    ◷ testFillStandaloneAll_10000 measured (0.001 s ±12.984% -- CPU Time)
    ◷ testFillStandaloneAll_10000 measured (0.001 s ±26.402% -- Clock Monotonic Time)
    ✔ testFillStandaloneAll_10000 (1.395 seconds)
    ◷ testFillStandaloneAll_100000 measured (98494.602 kI ±0.050% -- CPU Instructions Retired)
    ◷ testFillStandaloneAll_100000 measured (20095.345 kC ±2.263% -- CPU Cycles)
    ◷ testFillStandaloneAll_100000 measured (0.006 s ±3.732% -- CPU Time)
    ◷ testFillStandaloneAll_100000 measured (0.006 s ±4.397% -- Clock Monotonic Time)
    ✔ testFillStandaloneAll_100000 (7.164 seconds)

TestFillWithHelper
    ◷ testFillWithHelper100_100 measured (2468.535 kI ±1.508% -- CPU Instructions Retired)
    ◷ testFillWithHelper100_100 measured (614.099 kC ±10.403% -- CPU Cycles)
    ◷ testFillWithHelper100_100 measured (0.000 s ±14.197% -- CPU Time)
    ◷ testFillWithHelper100_100 measured (0.000 s ±67.438% -- Clock Monotonic Time)
    ✔ testFillWithHelper100_100 (0.683 seconds)
    ◷ testFillWithHelper100_1000 measured (2465.907 kI ±0.940% -- CPU Instructions Retired)
    ◷ testFillWithHelper100_1000 measured (605.431 kC ±7.452% -- CPU Cycles)
    ◷ testFillWithHelper100_1000 measured (0.000 s ±9.115% -- CPU Time)
    ◷ testFillWithHelper100_1000 measured (0.000 s ±32.600% -- Clock Monotonic Time)
    ✔ testFillWithHelper100_1000 (0.663 seconds)
    ◷ testFillWithHelper100_10000 measured (2463.558 kI ±0.733% -- CPU Instructions Retired)
    ◷ testFillWithHelper100_10000 measured (602.584 kC ±5.844% -- CPU Cycles)
    ◷ testFillWithHelper100_10000 measured (0.000 s ±6.926% -- CPU Time)
    ◷ testFillWithHelper100_10000 measured (0.000 s ±22.456% -- Clock Monotonic Time)
    ✔ testFillWithHelper100_10000 (0.671 seconds)
    ◷ testFillWithHelper100_100000 measured (2466.976 kI ±1.791% -- CPU Instructions Retired)
    ◷ testFillWithHelper100_100000 measured (601.142 kC ±5.915% -- CPU Cycles)
    ◷ testFillWithHelper100_100000 measured (0.000 s ±6.812% -- CPU Time)
    ◷ testFillWithHelper100_100000 measured (0.000 s ±30.159% -- Clock Monotonic Time)
    ✔ testFillWithHelper100_100000 (0.716 seconds)
    ◷ testFillWithHelper10_100 measured (2392.158 kI ±2.354% -- CPU Instructions Retired)
    ◷ testFillWithHelper10_100 measured (597.198 kC ±6.485% -- CPU Cycles)
    ◷ testFillWithHelper10_100 measured (0.000 s ±7.986% -- CPU Time)
    ◷ testFillWithHelper10_100 measured (0.000 s ±87.054% -- Clock Monotonic Time)
    ✔ testFillWithHelper10_100 (0.667 seconds)
    ◷ testFillWithHelper10_1000 measured (2388.462 kI ±0.877% -- CPU Instructions Retired)
    ◷ testFillWithHelper10_1000 measured (593.809 kC ±5.094% -- CPU Cycles)
    ◷ testFillWithHelper10_1000 measured (0.000 s ±6.002% -- CPU Time)
    ◷ testFillWithHelper10_1000 measured (0.000 s ±65.341% -- Clock Monotonic Time)
    ✔ testFillWithHelper10_1000 (0.669 seconds)
    ◷ testFillWithHelper10_10000 measured (2553.425 kI ±7.904% -- CPU Instructions Retired)
    ◷ testFillWithHelper10_10000 measured (629.324 kC ±7.961% -- CPU Cycles)
    ◷ testFillWithHelper10_10000 measured (0.000 s ±9.410% -- CPU Time)
    ◷ testFillWithHelper10_10000 measured (0.000 s ±111.493% -- Clock Monotonic Time)
    ✔ testFillWithHelper10_10000 (0.656 seconds)
    ◷ testFillWithHelper10_100000 measured (2458.429 kI ±6.640% -- CPU Instructions Retired)
    ◷ testFillWithHelper10_100000 measured (652.997 kC ±23.639% -- CPU Cycles)
    ◷ testFillWithHelper10_100000 measured (0.000 s ±37.808% -- CPU Time)
    ◷ testFillWithHelper10_100000 measured (0.000 s ±142.741% -- Clock Monotonic Time)
    ✔ testFillWithHelper10_100000 (0.935 seconds)
    ◷ testFillWithHelperAll_100 measured (2495.119 kI ±5.086% -- CPU Instructions Retired)
    ◷ testFillWithHelperAll_100 measured (627.408 kC ±19.295% -- CPU Cycles)
    ◷ testFillWithHelperAll_100 measured (0.000 s ±29.204% -- CPU Time)
    ◷ testFillWithHelperAll_100 measured (0.000 s ±492.391% -- Clock Monotonic Time)
    ✔ testFillWithHelperAll_100 (0.708 seconds)
    ◷ testFillWithHelperAll_1000 measured (3340.968 kI ±1.950% -- CPU Instructions Retired)
    ◷ testFillWithHelperAll_1000 measured (783.458 kC ±6.766% -- CPU Cycles)
    ◷ testFillWithHelperAll_1000 measured (0.000 s ±8.316% -- CPU Time)
    ◷ testFillWithHelperAll_1000 measured (0.000 s ±13.432% -- Clock Monotonic Time)
    ✔ testFillWithHelperAll_1000 (0.730 seconds)
    ◷ testFillWithHelperAll_10000 measured (12021.759 kI ±0.301% -- CPU Instructions Retired)
    ◷ testFillWithHelperAll_10000 measured (2527.654 kC ±1.917% -- CPU Cycles)
    ◷ testFillWithHelperAll_10000 measured (0.001 s ±2.521% -- CPU Time)
    ◷ testFillWithHelperAll_10000 measured (0.001 s ±1.921% -- Clock Monotonic Time)
    ✔ testFillWithHelperAll_10000 (1.310 seconds)
    ◷ testFillWithHelperAll_100000 measured (98941.718 kI ±0.162% -- CPU Instructions Retired)
    ◷ testFillWithHelperAll_100000 measured (20435.784 kC ±7.157% -- CPU Cycles)
    ◷ testFillWithHelperAll_100000 measured (0.007 s ±11.625% -- CPU Time)
    ◷ testFillWithHelperAll_100000 measured (0.007 s ±17.791% -- Clock Monotonic Time)
    ✔ testFillWithHelperAll_100000 (7.541 seconds)
```
