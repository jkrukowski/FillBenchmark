# FillBenchmark

Comparison of different approaches to filling a `MLMultiArray` with values for given indexes.

* `fill` - fills the array with a single value for given indexes
* `concurrentFill` - uses `DispatchQueue.concurrentPerform` to do the same

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
name                                             time            std        iterations
--------------------------------------------------------------------------------------
fill10.count=100, indexes=10                         2958.000 ns ±   8.12 %       1000
fill10.count=1_000, indexes=10                       2958.000 ns ±   6.01 %       1000
fill10.count=10_000, indexes=10                      3042.000 ns ±   1.58 %       1000
fill10.count=100_000, indexes=10                     3042.000 ns ±  30.97 %       1000
fill100.count=100, indexes=100                      29083.000 ns ±   8.71 %       1000
fill100.count=1_000, indexes=100                    29375.000 ns ±   5.09 %       1000
fill100.count=10_000, indexes=100                   28875.000 ns ±   2.98 %       1000
fill100.count=100_000, indexes=100                  28833.000 ns ±   4.43 %       1000
fillAll.count=100, indexes=100                      28916.000 ns ±   9.70 %       1000
fillAll.count=1_000, indexes=1_000                 289709.000 ns ±   4.60 %       1000
fillAll.count=10_000, indexes=10_000              2891916.500 ns ±  17.53 %       1000
fillAll.count=100_000, indexes=100_000           29462228.500 ns ±  13.68 %       1000
concurrentFill10.count=100, indexes=10               3709.000 ns ± 137.64 %       1000
concurrentFill10.count=1_000, indexes=10             3791.000 ns ±  89.56 %       1000
concurrentFill10.count=10_000, indexes=10            3791.000 ns ± 210.81 %       1000
concurrentFill10.count=100_000, indexes=10           3834.000 ns ± 870.18 %       1000
concurrentFill100.count=100, indexes=100            31583.500 ns ±  92.45 %       1000
concurrentFill100.count=1_000, indexes=100          30999.500 ns ±  62.63 %       1000
concurrentFill100.count=10_000, indexes=100         26875.000 ns ±  67.41 %       1000
concurrentFill100.count=100_000, indexes=100        33584.000 ns ± 134.25 %       1000
concurrentFillAll.count=100, indexes=100            27062.500 ns ±  61.02 %       1000
concurrentFillAll.count=1_000, indexes=1_000       568854.500 ns ±  38.14 %       1000
concurrentFillAll.count=10_000, indexes=10_000    6106875.500 ns ±  19.36 %       1000
concurrentFillAll.count=100_000, indexes=100_000 58349687.000 ns ±  10.99 %       1000
```

XCTests results (1000 iterations)

```
TestFill
    ◷ testFill100_100 measured (2825.087 kI ±4.426% -- CPU Instructions Retired)
    ◷ testFill100_100 measured (786.420 kC ±26.609% -- CPU Cycles)
    ◷ testFill100_100 measured (0.000 s ±40.745% -- CPU Time)
    ◷ testFill100_100 measured (0.000 s ±63.912% -- Clock Monotonic Time)
    ✔ testFill100_100 (0.903 seconds)
    ◷ testFill100_1000 measured (2807.534 kI ±3.715% -- CPU Instructions Retired)
    ◷ testFill100_1000 measured (719.647 kC ±13.437% -- CPU Cycles)
    ◷ testFill100_1000 measured (0.000 s ±21.423% -- CPU Time)
    ◷ testFill100_1000 measured (0.000 s ±36.643% -- Clock Monotonic Time)
    ✔ testFill100_1000 (0.802 seconds)
    ◷ testFill100_10000 measured (2814.326 kI ±3.041% -- CPU Instructions Retired)
    ◷ testFill100_10000 measured (776.096 kC ±24.927% -- CPU Cycles)
    ◷ testFill100_10000 measured (0.000 s ±39.497% -- CPU Time)
    ◷ testFill100_10000 measured (0.000 s ±68.429% -- Clock Monotonic Time)
    ✔ testFill100_10000 (0.884 seconds)
    ◷ testFill100_100000 measured (2819.498 kI ±4.365% -- CPU Instructions Retired)
    ◷ testFill100_100000 measured (716.133 kC ±12.193% -- CPU Cycles)
    ◷ testFill100_100000 measured (0.000 s ±20.125% -- CPU Time)
    ◷ testFill100_100000 measured (0.000 s ±91.295% -- Clock Monotonic Time)
    ✔ testFill100_100000 (0.809 seconds)
    ◷ testFill10_100 measured (2432.578 kI ±2.655% -- CPU Instructions Retired)
    ◷ testFill10_100 measured (677.507 kC ±23.553% -- CPU Cycles)
    ◷ testFill10_100 measured (0.000 s ±37.642% -- CPU Time)
    ◷ testFill10_100 measured (0.000 s ±158.554% -- Clock Monotonic Time)
    ✔ testFill10_100 (0.868 seconds)
    ◷ testFill10_1000 measured (2440.910 kI ±4.228% -- CPU Instructions Retired)
    ◷ testFill10_1000 measured (631.953 kC ±13.430% -- CPU Cycles)
    ◷ testFill10_1000 measured (0.000 s ±21.677% -- CPU Time)
    ◷ testFill10_1000 measured (0.000 s ±89.620% -- Clock Monotonic Time)
    ✔ testFill10_1000 (0.753 seconds)
    ◷ testFill10_10000 measured (2444.722 kI ±3.789% -- CPU Instructions Retired)
    ◷ testFill10_10000 measured (695.760 kC ±25.500% -- CPU Cycles)
    ◷ testFill10_10000 measured (0.000 s ±39.572% -- CPU Time)
    ◷ testFill10_10000 measured (0.000 s ±277.632% -- Clock Monotonic Time)
    ✔ testFill10_10000 (0.944 seconds)
    ◷ testFill10_100000 measured (2453.119 kI ±4.673% -- CPU Instructions Retired)
    ◷ testFill10_100000 measured (642.075 kC ±13.367% -- CPU Cycles)
    ◷ testFill10_100000 measured (0.000 s ±18.971% -- CPU Time)
    ◷ testFill10_100000 measured (0.000 s ±109.384% -- Clock Monotonic Time)
    ✔ testFill10_100000 (0.823 seconds)
    ◷ testFillAll_100 measured (2811.832 kI ±2.906% -- CPU Instructions Retired)
    ◷ testFillAll_100 measured (798.813 kC ±27.825% -- CPU Cycles)
    ◷ testFillAll_100 measured (0.000 s ±42.136% -- CPU Time)
    ◷ testFillAll_100 measured (0.000 s ±55.048% -- Clock Monotonic Time)
    ✔ testFillAll_100 (0.952 seconds)
    ◷ testFillAll_1000 measured (6472.455 kI ±0.347% -- CPU Instructions Retired)
    ◷ testFillAll_1000 measured (1510.843 kC ±5.087% -- CPU Cycles)
    ◷ testFillAll_1000 measured (0.001 s ±9.965% -- CPU Time)
    ◷ testFillAll_1000 measured (0.000 s ±11.701% -- Clock Monotonic Time)
    ✔ testFillAll_1000 (1.018 seconds)
    ◷ testFillAll_10000 measured (43442.871 kI ±0.177% -- CPU Instructions Retired)
    ◷ testFillAll_10000 measured (10095.768 kC ±8.120% -- CPU Cycles)
    ◷ testFillAll_10000 measured (0.004 s ±17.066% -- CPU Time)
    ◷ testFillAll_10000 measured (0.003 s ±20.526% -- Clock Monotonic Time)
    ✔ testFillAll_10000 (4.171 seconds)
    ◷ testFillAll_100000 measured (412981.630 kI ±0.045% -- CPU Instructions Retired)
    ◷ testFillAll_100000 measured (94972.285 kC ±3.898% -- CPU Cycles)
    ◷ testFillAll_100000 measured (0.033 s ±8.729% -- CPU Time)
    ◷ testFillAll_100000 measured (0.033 s ±11.932% -- Clock Monotonic Time)
    ✔ testFillAll_100000 (34.425 seconds)

TestConcurrentFill
    ◷ testConcurrentFill100_100 measured (3009.566 kI ±4.175% -- CPU Instructions Retired)
    ◷ testConcurrentFill100_100 measured (919.939 kC ±23.337% -- CPU Cycles)
    ◷ testConcurrentFill100_100 measured (0.000 s ±28.145% -- CPU Time)
    ◷ testConcurrentFill100_100 measured (0.000 s ±46.875% -- Clock Monotonic Time)
    ✔ testConcurrentFill100_100 (0.832 seconds)
    ◷ testConcurrentFill100_1000 measured (2998.599 kI ±2.531% -- CPU Instructions Retired)
    ◷ testConcurrentFill100_1000 measured (914.844 kC ±23.368% -- CPU Cycles)
    ◷ testConcurrentFill100_1000 measured (0.000 s ±29.104% -- CPU Time)
    ◷ testConcurrentFill100_1000 measured (0.000 s ±54.554% -- Clock Monotonic Time)
    ✔ testConcurrentFill100_1000 (0.713 seconds)
    ◷ testConcurrentFill100_10000 measured (3039.593 kI ±5.607% -- CPU Instructions Retired)
    ◷ testConcurrentFill100_10000 measured (982.094 kC ±27.651% -- CPU Cycles)
    ◷ testConcurrentFill100_10000 measured (0.000 s ±38.510% -- CPU Time)
    ◷ testConcurrentFill100_10000 measured (0.000 s ±125.641% -- Clock Monotonic Time)
    ✔ testConcurrentFill100_10000 (0.805 seconds)
    ◷ testConcurrentFill100_100000 measured (3061.978 kI ±5.826% -- CPU Instructions Retired)
    ◷ testConcurrentFill100_100000 measured (1070.758 kC ±29.817% -- CPU Cycles)
    ◷ testConcurrentFill100_100000 measured (0.000 s ±41.665% -- CPU Time)
    ◷ testConcurrentFill100_100000 measured (0.000 s ±83.701% -- Clock Monotonic Time)
    ✔ testConcurrentFill100_100000 (0.879 seconds)
    ◷ testConcurrentFill10_100 measured (2520.107 kI ±1.954% -- CPU Instructions Retired)
    ◷ testConcurrentFill10_100 measured (699.372 kC ±13.160% -- CPU Cycles)
    ◷ testConcurrentFill10_100 measured (0.000 s ±19.435% -- CPU Time)
    ◷ testConcurrentFill10_100 measured (0.000 s ±75.468% -- Clock Monotonic Time)
    ✔ testConcurrentFill10_100 (0.748 seconds)
    ◷ testConcurrentFill10_1000 measured (2520.418 kI ±2.021% -- CPU Instructions Retired)
    ◷ testConcurrentFill10_1000 measured (690.676 kC ±10.373% -- CPU Cycles)
    ◷ testConcurrentFill10_1000 measured (0.000 s ±13.250% -- CPU Time)
    ◷ testConcurrentFill10_1000 measured (0.000 s ±52.739% -- Clock Monotonic Time)
    ✔ testConcurrentFill10_1000 (0.682 seconds)
    ◷ testConcurrentFill10_10000 measured (2562.969 kI ±5.319% -- CPU Instructions Retired)
    ◷ testConcurrentFill10_10000 measured (776.959 kC ±23.417% -- CPU Cycles)
    ◷ testConcurrentFill10_10000 measured (0.000 s ±36.976% -- CPU Time)
    ◷ testConcurrentFill10_10000 measured (0.000 s ±138.482% -- Clock Monotonic Time)
    ✔ testConcurrentFill10_10000 (0.787 seconds)
    ◷ testConcurrentFill10_100000 measured (2517.812 kI ±2.018% -- CPU Instructions Retired)
    ◷ testConcurrentFill10_100000 measured (695.051 kC ±10.764% -- CPU Cycles)
    ◷ testConcurrentFill10_100000 measured (0.000 s ±13.989% -- CPU Time)
    ◷ testConcurrentFill10_100000 measured (0.000 s ±123.072% -- Clock Monotonic Time)
    ✔ testConcurrentFill10_100000 (0.814 seconds)
    ◷ testConcurrentFillAll_100 measured (3002.004 kI ±2.568% -- CPU Instructions Retired)
    ◷ testConcurrentFillAll_100 measured (923.863 kC ±22.653% -- CPU Cycles)
    ◷ testConcurrentFillAll_100 measured (0.000 s ±29.620% -- CPU Time)
    ◷ testConcurrentFillAll_100 measured (0.000 s ±51.872% -- Clock Monotonic Time)
    ✔ testConcurrentFillAll_100 (0.728 seconds)
    ◷ testConcurrentFillAll_1000 measured (8590.728 kI ±8.628% -- CPU Instructions Retired)
    ◷ testConcurrentFillAll_1000 measured (6485.658 kC ±32.614% -- CPU Cycles)
    ◷ testConcurrentFillAll_1000 measured (0.002 s ±34.136% -- CPU Time)
    ◷ testConcurrentFillAll_1000 measured (0.001 s ±33.625% -- Clock Monotonic Time)
    ✔ testConcurrentFillAll_1000 (1.353 seconds)
    ◷ testConcurrentFillAll_10000 measured (68253.810 kI ±10.433% -- CPU Instructions Retired)
    ◷ testConcurrentFillAll_10000 measured (70809.005 kC ±30.380% -- CPU Cycles)
    ◷ testConcurrentFillAll_10000 measured (0.028 s ±30.290% -- CPU Time)
    ◷ testConcurrentFillAll_10000 measured (0.006 s ±17.140% -- Clock Monotonic Time)
    ✔ testConcurrentFillAll_10000 (6.771 seconds)
    ◷ testConcurrentFillAll_100000 measured (659141.088 kI ±9.310% -- CPU Instructions Retired)
    ◷ testConcurrentFillAll_100000 measured (710202.713 kC ±27.016% -- CPU Cycles)
    ◷ testConcurrentFillAll_100000 measured (0.283 s ±26.274% -- CPU Time)
    ◷ testConcurrentFillAll_100000 measured (0.058 s ±10.652% -- Clock Monotonic Time)
    ✔ testConcurrentFillAll_100000 (61.888 seconds)
```
