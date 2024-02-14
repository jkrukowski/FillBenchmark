import Benchmark
import CoreML
import FillBenchmark

let settings: BenchmarkSetting = Iterations(1000)

internal let fillBenchmark10 = BenchmarkSuite(name: "fill10", settings: settings) { suite in
    let logits1 = MLMultiArray.logits(count: 100)
    let indexes1 = indexes(count: 10)
    suite.benchmark("count=100, indexes=10") {
        logits1.fill(indexes: indexes1, with: -Float.infinity)
    }

    let logits2 = MLMultiArray.logits(count: 1000)
    let indexes2 = indexes(count: 10)
    suite.benchmark("count=1_000, indexes=10") {
        logits2.fill(indexes: indexes2, with: -Float.infinity)
    }

    let logits3 = MLMultiArray.logits(count: 10000)
    let indexes3 = indexes(count: 10)
    suite.benchmark("count=10_000, indexes=10") {
        logits3.fill(indexes: indexes3, with: -Float.infinity)
    }

    let logits4 = MLMultiArray.logits(count: 100_000)
    let indexes4 = indexes(count: 10)
    suite.benchmark("count=100_000, indexes=10") {
        logits4.fill(indexes: indexes4, with: -Float.infinity)
    }
}

internal let fillBenchmark100 = BenchmarkSuite(name: "fill100", settings: settings) { suite in
    let logits1 = MLMultiArray.logits(count: 100)
    let indexes1 = indexes(count: 100)
    suite.benchmark("count=100, indexes=100") {
        logits1.fill(indexes: indexes1, with: -Float.infinity)
    }

    let logits2 = MLMultiArray.logits(count: 1000)
    let indexes2 = indexes(count: 100)
    suite.benchmark("count=1_000, indexes=100") {
        logits2.fill(indexes: indexes2, with: -Float.infinity)
    }

    let logits3 = MLMultiArray.logits(count: 10000)
    let indexes3 = indexes(count: 100)
    suite.benchmark("count=10_000, indexes=100") {
        logits3.fill(indexes: indexes3, with: -Float.infinity)
    }

    let logits4 = MLMultiArray.logits(count: 100_000)
    let indexes4 = indexes(count: 100)
    suite.benchmark("count=100_000, indexes=100") {
        logits4.fill(indexes: indexes4, with: -Float.infinity)
    }
}

internal let fillBenchmarkAll = BenchmarkSuite(name: "fillAll", settings: settings) { suite in
    let logits1 = MLMultiArray.logits(count: 100)
    let indexes1 = indexes(count: 100)
    suite.benchmark("count=100, indexes=100") {
        logits1.fill(indexes: indexes1, with: -Float.infinity)
    }

    let logits2 = MLMultiArray.logits(count: 1000)
    let indexes2 = indexes(count: 1000)
    suite.benchmark("count=1_000, indexes=1_000") {
        logits2.fill(indexes: indexes2, with: -Float.infinity)
    }

    let logits3 = MLMultiArray.logits(count: 10000)
    let indexes3 = indexes(count: 10000)
    suite.benchmark("count=10_000, indexes=10_000") {
        logits3.fill(indexes: indexes3, with: -Float.infinity)
    }

    let logits4 = MLMultiArray.logits(count: 100_000)
    let indexes4 = indexes(count: 100_000)
    suite.benchmark("count=100_000, indexes=100_000") {
        logits4.fill(indexes: indexes4, with: -Float.infinity)
    }
}

internal let concurrentFillBenchmark10 = BenchmarkSuite(name: "concurrentFill10", settings: settings) { suite in
    let logits1 = MLMultiArray.logits(count: 100)
    let indexes1 = indexes(count: 10)
    suite.benchmark("count=100, indexes=10") {
        logits1.concurrentFill(indexes: indexes1, with: -Float.infinity)
    }

    let logits2 = MLMultiArray.logits(count: 1000)
    let indexes2 = indexes(count: 10)
    suite.benchmark("count=1_000, indexes=10") {
        logits2.concurrentFill(indexes: indexes2, with: -Float.infinity)
    }

    let logits3 = MLMultiArray.logits(count: 10000)
    let indexes3 = indexes(count: 10)
    suite.benchmark("count=10_000, indexes=10") {
        logits3.concurrentFill(indexes: indexes3, with: -Float.infinity)
    }

    let logits4 = MLMultiArray.logits(count: 100_000)
    let indexes4 = indexes(count: 10)
    suite.benchmark("count=100_000, indexes=10") {
        logits4.concurrentFill(indexes: indexes4, with: -Float.infinity)
    }
}

internal let concurrentFillBenchmark100 = BenchmarkSuite(name: "concurrentFill100", settings: settings) { suite in
    let logits1 = MLMultiArray.logits(count: 100)
    let indexes1 = indexes(count: 100)
    suite.benchmark("count=100, indexes=100") {
        logits1.concurrentFill(indexes: indexes1, with: -Float.infinity)
    }

    let logits2 = MLMultiArray.logits(count: 1000)
    let indexes2 = indexes(count: 100)
    suite.benchmark("count=1_000, indexes=100") {
        logits2.concurrentFill(indexes: indexes2, with: -Float.infinity)
    }

    let logits3 = MLMultiArray.logits(count: 10000)
    let indexes3 = indexes(count: 100)
    suite.benchmark("count=10_000, indexes=100") {
        logits3.concurrentFill(indexes: indexes3, with: -Float.infinity)
    }

    let logits4 = MLMultiArray.logits(count: 100_000)
    let indexes4 = indexes(count: 100)
    suite.benchmark("count=100_000, indexes=100") {
        logits4.concurrentFill(indexes: indexes4, with: -Float.infinity)
    }
}

internal let concurrentFillBenchmarkAll = BenchmarkSuite(name: "concurrentFillAll", settings: settings) { suite in
    let logits1 = MLMultiArray.logits(count: 100)
    let indexes1 = indexes(count: 100)
    suite.benchmark("count=100, indexes=100") {
        logits1.concurrentFill(indexes: indexes1, with: -Float.infinity)
    }

    let logits2 = MLMultiArray.logits(count: 1000)
    let indexes2 = indexes(count: 1000)
    suite.benchmark("count=1_000, indexes=1_000") {
        logits2.concurrentFill(indexes: indexes2, with: -Float.infinity)
    }

    let logits3 = MLMultiArray.logits(count: 10000)
    let indexes3 = indexes(count: 10000)
    suite.benchmark("count=10_000, indexes=10_000") {
        logits3.concurrentFill(indexes: indexes3, with: -Float.infinity)
    }

    let logits4 = MLMultiArray.logits(count: 100_000)
    let indexes4 = indexes(count: 100_000)
    suite.benchmark("count=100_000, indexes=100_000") {
        logits4.concurrentFill(indexes: indexes4, with: -Float.infinity)
    }
}

internal let standaloneFillBenchmark10 = BenchmarkSuite(name: "standaloneFill10", settings: settings) { suite in
    let logits1 = MLMultiArray.logits(count: 100)
    let indexes1 = indexes(count: 10)
    suite.benchmark("count=100, indexes=10") {
        logits1.fillStandalone(indexes: indexes1, with: -Float.infinity)
    }

    let logits2 = MLMultiArray.logits(count: 1000)
    let indexes2 = indexes(count: 10)
    suite.benchmark("count=1_000, indexes=10") {
        logits2.fillStandalone(indexes: indexes2, with: -Float.infinity)
    }

    let logits3 = MLMultiArray.logits(count: 10000)
    let indexes3 = indexes(count: 10)
    suite.benchmark("count=10_000, indexes=10") {
        logits3.fillStandalone(indexes: indexes3, with: -Float.infinity)
    }

    let logits4 = MLMultiArray.logits(count: 100_000)
    let indexes4 = indexes(count: 10)
    suite.benchmark("count=100_000, indexes=10") {
        logits4.fillStandalone(indexes: indexes4, with: -Float.infinity)
    }
}

internal let standaloneFillBenchmark100 = BenchmarkSuite(name: "standaloneFill100", settings: settings) { suite in
    let logits1 = MLMultiArray.logits(count: 100)
    let indexes1 = indexes(count: 100)
    suite.benchmark("count=100, indexes=100") {
        logits1.fillStandalone(indexes: indexes1, with: -Float.infinity)
    }

    let logits2 = MLMultiArray.logits(count: 1000)
    let indexes2 = indexes(count: 100)
    suite.benchmark("count=1_000, indexes=100") {
        logits2.fillStandalone(indexes: indexes2, with: -Float.infinity)
    }

    let logits3 = MLMultiArray.logits(count: 10000)
    let indexes3 = indexes(count: 100)
    suite.benchmark("count=10_000, indexes=100") {
        logits3.fillStandalone(indexes: indexes3, with: -Float.infinity)
    }

    let logits4 = MLMultiArray.logits(count: 100_000)
    let indexes4 = indexes(count: 100)
    suite.benchmark("count=100_000, indexes=100") {
        logits4.fillStandalone(indexes: indexes4, with: -Float.infinity)
    }
}

internal let standaloneFillBenchmarkAll = BenchmarkSuite(name: "standaloneFillAll", settings: settings) { suite in
    let logits1 = MLMultiArray.logits(count: 100)
    let indexes1 = indexes(count: 100)
    suite.benchmark("count=100, indexes=100") {
        logits1.fillStandalone(indexes: indexes1, with: -Float.infinity)
    }

    let logits2 = MLMultiArray.logits(count: 1000)
    let indexes2 = indexes(count: 1000)
    suite.benchmark("count=1_000, indexes=1_000") {
        logits2.fillStandalone(indexes: indexes2, with: -Float.infinity)
    }

    let logits3 = MLMultiArray.logits(count: 10000)
    let indexes3 = indexes(count: 10000)
    suite.benchmark("count=10_000, indexes=10_000") {
        logits3.fillStandalone(indexes: indexes3, with: -Float.infinity)
    }

    let logits4 = MLMultiArray.logits(count: 100_000)
    let indexes4 = indexes(count: 100_000)
    suite.benchmark("count=100_000, indexes=100_000") {
        logits4.fillStandalone(indexes: indexes4, with: -Float.infinity)
    }
}

internal let helperFillBenchmark10 = BenchmarkSuite(name: "helperFill10", settings: settings) { suite in
    let logits1 = MLMultiArray.logits(count: 100)
    let indexes1 = indexes(count: 10)
    suite.benchmark("count=100, indexes=10") {
        logits1.fillWithHelper(indexes: indexes1, with: -Float.infinity)
    }

    let logits2 = MLMultiArray.logits(count: 1000)
    let indexes2 = indexes(count: 10)
    suite.benchmark("count=1_000, indexes=10") {
        logits2.fillWithHelper(indexes: indexes2, with: -Float.infinity)
    }

    let logits3 = MLMultiArray.logits(count: 10000)
    let indexes3 = indexes(count: 10)
    suite.benchmark("count=10_000, indexes=10") {
        logits3.fillWithHelper(indexes: indexes3, with: -Float.infinity)
    }

    let logits4 = MLMultiArray.logits(count: 100_000)
    let indexes4 = indexes(count: 10)
    suite.benchmark("count=100_000, indexes=10") {
        logits4.fillWithHelper(indexes: indexes4, with: -Float.infinity)
    }
}

internal let helperFillBenchmark100 = BenchmarkSuite(name: "helperFill100", settings: settings) { suite in
    let logits1 = MLMultiArray.logits(count: 100)
    let indexes1 = indexes(count: 100)
    suite.benchmark("count=100, indexes=100") {
        logits1.fillWithHelper(indexes: indexes1, with: -Float.infinity)
    }

    let logits2 = MLMultiArray.logits(count: 1000)
    let indexes2 = indexes(count: 100)
    suite.benchmark("count=1_000, indexes=100") {
        logits2.fillWithHelper(indexes: indexes2, with: -Float.infinity)
    }

    let logits3 = MLMultiArray.logits(count: 10000)
    let indexes3 = indexes(count: 100)
    suite.benchmark("count=10_000, indexes=100") {
        logits3.fillWithHelper(indexes: indexes3, with: -Float.infinity)
    }

    let logits4 = MLMultiArray.logits(count: 100_000)
    let indexes4 = indexes(count: 100)
    suite.benchmark("count=100_000, indexes=100") {
        logits4.fillWithHelper(indexes: indexes4, with: -Float.infinity)
    }
}

internal let helperFillBenchmarkAll = BenchmarkSuite(name: "helperFillAll", settings: settings) { suite in
    let logits1 = MLMultiArray.logits(count: 100)
    let indexes1 = indexes(count: 100)
    suite.benchmark("count=100, indexes=100") {
        logits1.fillWithHelper(indexes: indexes1, with: -Float.infinity)
    }

    let logits2 = MLMultiArray.logits(count: 1000)
    let indexes2 = indexes(count: 1000)
    suite.benchmark("count=1_000, indexes=1_000") {
        logits2.fillWithHelper(indexes: indexes2, with: -Float.infinity)
    }

    let logits3 = MLMultiArray.logits(count: 10000)
    let indexes3 = indexes(count: 10000)
    suite.benchmark("count=10_000, indexes=10_000") {
        logits3.fillWithHelper(indexes: indexes3, with: -Float.infinity)
    }

    let logits4 = MLMultiArray.logits(count: 100_000)
    let indexes4 = indexes(count: 100_000)
    suite.benchmark("count=100_000, indexes=100_000") {
        logits4.fillWithHelper(indexes: indexes4, with: -Float.infinity)
    }
}

public let allBenchmarks = [
    fillBenchmark10,
    fillBenchmark100,
    fillBenchmarkAll,
    concurrentFillBenchmark10,
    concurrentFillBenchmark100,
    concurrentFillBenchmarkAll,
    standaloneFillBenchmark10,
    standaloneFillBenchmark100,
    standaloneFillBenchmarkAll,
    helperFillBenchmark10,
    helperFillBenchmark100,
    helperFillBenchmarkAll,
]
