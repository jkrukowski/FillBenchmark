import XCTest

extension XCTestCase {
    static var options: XCTMeasureOptions {
        let options = XCTMeasureOptions.default
        options.iterationCount = 1000
        return options
    }

    static let metrics: [any XCTMetric] = [XCTCPUMetric(), XCTClockMetric()]
}
