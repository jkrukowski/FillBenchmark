import CoreML
@testable import FillBenchmark
import XCTest

internal final class TestFillWithHelper: XCTestCase {
    internal func testFillWithHelper10_100() {
        let logits1 = MLMultiArray.logits(count: 100)
        let indexes1 = indexes(count: 10)
        measure(metrics: Self.metrics, options: Self.options) {
            logits1.fillWithHelper(indexes: indexes1, with: -Float.infinity)
        }
    }

    internal func testFillWithHelper10_1000() {
        let logits2 = MLMultiArray.logits(count: 1000)
        let indexes2 = indexes(count: 10)
        measure(metrics: Self.metrics, options: Self.options) {
            logits2.fillWithHelper(indexes: indexes2, with: -Float.infinity)
        }
    }

    internal func testFillWithHelper10_10000() {
        let logits3 = MLMultiArray.logits(count: 10000)
        let indexes3 = indexes(count: 10)
        measure(metrics: Self.metrics, options: Self.options) {
            logits3.fillWithHelper(indexes: indexes3, with: -Float.infinity)
        }
    }

    internal func testFillWithHelper10_100000() {
        let logits4 = MLMultiArray.logits(count: 100_000)
        let indexes4 = indexes(count: 10)
        measure(metrics: Self.metrics, options: Self.options) {
            logits4.fillWithHelper(indexes: indexes4, with: -Float.infinity)
        }
    }

    internal func testFillWithHelper100_100() {
        let logits1 = MLMultiArray.logits(count: 100)
        let indexes1 = indexes(count: 100)
        measure(metrics: Self.metrics, options: Self.options) {
            logits1.fillWithHelper(indexes: indexes1, with: -Float.infinity)
        }
    }

    internal func testFillWithHelper100_1000() {
        let logits2 = MLMultiArray.logits(count: 1000)
        let indexes2 = indexes(count: 100)
        measure(metrics: Self.metrics, options: Self.options) {
            logits2.fillWithHelper(indexes: indexes2, with: -Float.infinity)
        }
    }

    internal func testFillWithHelper100_10000() {
        let logits3 = MLMultiArray.logits(count: 10000)
        let indexes3 = indexes(count: 100)
        measure(metrics: Self.metrics, options: Self.options) {
            logits3.fillWithHelper(indexes: indexes3, with: -Float.infinity)
        }
    }

    internal func testFillWithHelper100_100000() {
        let logits4 = MLMultiArray.logits(count: 100_000)
        let indexes4 = indexes(count: 100)
        measure(metrics: Self.metrics, options: Self.options) {
            logits4.fillWithHelper(indexes: indexes4, with: -Float.infinity)
        }
    }

    internal func testFillWithHelperAll_100() {
        let logits1 = MLMultiArray.logits(count: 100)
        let indexes1 = indexes(count: 100)
        measure(metrics: Self.metrics, options: Self.options) {
            logits1.fillWithHelper(indexes: indexes1, with: -Float.infinity)
        }
    }

    internal func testFillWithHelperAll_1000() {
        let logits2 = MLMultiArray.logits(count: 1000)
        let indexes2 = indexes(count: 1000)
        measure(metrics: Self.metrics, options: Self.options) {
            logits2.fillWithHelper(indexes: indexes2, with: -Float.infinity)
        }
    }

    internal func testFillWithHelperAll_10000() {
        let logits3 = MLMultiArray.logits(count: 10000)
        let indexes3 = indexes(count: 10000)
        measure(metrics: Self.metrics, options: Self.options) {
            logits3.fillWithHelper(indexes: indexes3, with: -Float.infinity)
        }
    }

    internal func testFillWithHelperAll_100000() {
        let logits4 = MLMultiArray.logits(count: 100_000)
        let indexes4 = indexes(count: 100_000)
        measure(metrics: Self.metrics, options: Self.options) {
            logits4.fillWithHelper(indexes: indexes4, with: -Float.infinity)
        }
    }
}
