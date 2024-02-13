import CoreML

public extension Array where Element == Float {
    static func random(_ count: Int) -> [Element] {
        (0 ..< count).map { _ in
            Float.random(in: -10 ... 10)
        }
    }
}

public func indexes(count: Int) -> [[NSNumber]] {
    (0 ..< count).map { _ in
        [0, 0, Int.random(in: 0 ..< count) as NSNumber]
    }
}

public extension MLMultiArray {
    /// Calculate the linear offset by summing the products of each dimension’s
    /// index with the dimension’s stride
    ///
    /// More info here: https://developer.apple.com/documentation/coreml/mlmultiarray/2879231-subscript
    internal func linearOffset(for index: [NSNumber], strides strideInts: [Int]? = nil) -> Int {
        var linearOffset = 0
        let strideInts = strideInts ?? strides.map { $0.intValue }
        for (dimension, stride) in zip(index, strideInts) {
            linearOffset += dimension.intValue * stride
        }
        return linearOffset
    }

    func fill<Value>(indexes: [[NSNumber]], with value: Value) {
        let pointer = UnsafeMutablePointer<Value>(OpaquePointer(dataPointer))
        for index in indexes {
            let linearOffset = linearOffset(for: index)
            pointer[linearOffset] = value
        }
    }

    func concurrentFill<Value>(indexes: [[NSNumber]], with value: Value) {
        DispatchQueue.concurrentPerform(iterations: indexes.count) { i in
            let pointer = UnsafeMutablePointer<Value>(OpaquePointer(dataPointer))
            let index = indexes[i]
            let linearOffset = linearOffset(for: index)
            pointer[linearOffset] = value
        }
    }

    func fillStandalone<Value>(indexes: [[NSNumber]], value: Value) {
        let pointer = UnsafeMutablePointer<Value>(OpaquePointer(dataPointer))
        let strideInts = strides.map { $0.intValue }
        var offset = 0

        for indexArray in indexes {
            for i in 0..<strideInts.count {
                offset += indexArray[i].intValue * strideInts[i]
            }

            if offset >= 0 && offset < count {
                pointer.advanced(by: offset).pointee = value
            }
        }
    } 

    func fillWithHelper<Value>(indexes: [[NSNumber]], value: Value) {
        let pointer = UnsafeMutablePointer<Value>(OpaquePointer(dataPointer))
        let strideInts = strides.map { $0.intValue }

        for indexArray in indexes {
            let linearOffset = linearOffset(for: indexArray, strides: strideInts)
            pointer.advanced(by: linearOffset).pointee = value
        }
    }

    /// Create `MLMultiArray` of shape [1, 1, arr.count] and fill up the last
    /// dimension with with values from arr.
    static func logits(count: Int) -> MLMultiArray {
        let arr = Array<Float>.random(count)
        let logits = try! MLMultiArray(shape: [1, 1, arr.count] as [NSNumber], dataType: .float)
        let ptr = UnsafeMutablePointer<Float>(OpaquePointer(logits.dataPointer))
        for (index, value) in arr.enumerated() {
            let linearOffset = logits.linearOffset(for: [0, 0, index as NSNumber])
            ptr[linearOffset] = value
        }
        return logits
    }
}
