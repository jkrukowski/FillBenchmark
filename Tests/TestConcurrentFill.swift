import CoreML
@testable import FillBenchmark
import XCTest

internal final class TestConcurrentFill: XCTestCase {
    internal func testConcurrentFill10_100() {
        let logits1 = MLMultiArray.logits(count: 100)
        let indexes1 = indexes(count: 10)
        measure(metrics: Self.metrics, options: Self.options) {
            logits1.concurrentFill(indexes: indexes1, with: -Float.infinity)
        }
    }

    internal func testConcurrentFill10_1000() {
        let logits2 = MLMultiArray.logits(count: 1000)
        let indexes2 = indexes(count: 10)
        measure(metrics: Self.metrics, options: Self.options) {
            logits2.concurrentFill(indexes: indexes2, with: -Float.infinity)
        }
    }

    internal func testConcurrentFill10_10000() {
        let logits3 = MLMultiArray.logits(count: 10000)
        let indexes3 = indexes(count: 10)
        measure(metrics: Self.metrics, options: Self.options) {
            logits3.concurrentFill(indexes: indexes3, with: -Float.infinity)
        }
    }

    internal func testConcurrentFill10_100000() {
        let logits4 = MLMultiArray.logits(count: 100_000)
        let indexes4 = indexes(count: 10)
        measure(metrics: Self.metrics, options: Self.options) {
            logits4.concurrentFill(indexes: indexes4, with: -Float.infinity)
        }
    }

    internal func testConcurrentFill100_100() {
        let logits1 = MLMultiArray.logits(count: 100)
        let indexes1 = indexes(count: 100)
        measure(metrics: Self.metrics, options: Self.options) {
            logits1.concurrentFill(indexes: indexes1, with: -Float.infinity)
        }
    }

    internal func testConcurrentFill100_1000() {
        let logits2 = MLMultiArray.logits(count: 1000)
        let indexes2 = indexes(count: 100)
        measure(metrics: Self.metrics, options: Self.options) {
            logits2.concurrentFill(indexes: indexes2, with: -Float.infinity)
        }
    }

    internal func testConcurrentFill100_10000() {
        let logits3 = MLMultiArray.logits(count: 10000)
        let indexes3 = indexes(count: 100)
        measure(metrics: Self.metrics, options: Self.options) {
            logits3.concurrentFill(indexes: indexes3, with: -Float.infinity)
        }
    }

    internal func testConcurrentFill100_100000() {
        let logits4 = MLMultiArray.logits(count: 100_000)
        let indexes4 = indexes(count: 100)
        measure(metrics: Self.metrics, options: Self.options) {
            logits4.concurrentFill(indexes: indexes4, with: -Float.infinity)
        }
    }

    internal func testConcurrentFillAll_100() {
        let logits1 = MLMultiArray.logits(count: 100)
        let indexes1 = indexes(count: 100)
        measure(metrics: Self.metrics, options: Self.options) {
            logits1.concurrentFill(indexes: indexes1, with: -Float.infinity)
        }
    }

    internal func testConcurrentFillAll_1000() {
        let logits2 = MLMultiArray.logits(count: 1000)
        let indexes2 = indexes(count: 1000)
        measure(metrics: Self.metrics, options: Self.options) {
            logits2.concurrentFill(indexes: indexes2, with: -Float.infinity)
        }
    }

    internal func testConcurrentFillAll_10000() {
        let logits3 = MLMultiArray.logits(count: 10000)
        let indexes3 = indexes(count: 10000)
        measure(metrics: Self.metrics, options: Self.options) {
            logits3.concurrentFill(indexes: indexes3, with: -Float.infinity)
        }
    }

    internal func testConcurrentFillAll_100000() {
        let logits4 = MLMultiArray.logits(count: 100_000)
        let indexes4 = indexes(count: 100_000)
        measure(metrics: Self.metrics, options: Self.options) {
            logits4.concurrentFill(indexes: indexes4, with: -Float.infinity)
        }
    }
}
