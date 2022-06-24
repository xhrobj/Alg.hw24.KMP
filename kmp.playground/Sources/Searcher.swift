typealias DeltaTableRecord = [Character: Int]

public struct Searcher {
    private var pattern: String = ""
    private var deltaTable: [DeltaTableRecord] = []

    public init() {}

    public mutating func find(_ needle: String, in heap: String) -> Int? {
        if needle != pattern {
            pattern = needle
            createDeltaTable(for: pattern)
        }

        let patternSize = deltaTable.count
        var currentPosition = 0

        for (index, char) in heap.enumerated() {
            let lineRecord = deltaTable[currentPosition]
            guard let position = lineRecord[char] else {
                currentPosition = 0
                continue
            }
            currentPosition = position
            guard currentPosition != patternSize else {
                return index - patternSize + 1
            }
        }

        return nil
    }

    private mutating func createDeltaTable(for pattern: String) {
        var deltaTable = [DeltaTableRecord]()
        let patternAlphabet = Set(Array(pattern))

        for i in 0..<pattern.count {
            var lineRecord = DeltaTableRecord()
            for char in patternAlphabet {
                let line = pattern.prefix(i) + String(char)
                var j = i + 1
                while pattern.prefix(j) != line.suffix(j) {
                    j -= 1
                }
                lineRecord[char] = j
            }
            deltaTable.append(lineRecord)
        }

        self.deltaTable = deltaTable
    }
}

extension String {
    func prefix(_ length: Int) -> String {
        guard !self.isEmpty, length > 0 else { return "" }
        guard self.count > length else { return self }
        let endIndex = self.index(self.startIndex, offsetBy: length)
        return String(self[self.startIndex..<endIndex])
    }

    func suffix(_ length: Int) -> String {
        guard !self.isEmpty, length > 0 else { return "" }
        guard self.count > length else { return self }
        let startIndex = self.index(self.endIndex, offsetBy: -length)
        return String(self[startIndex...])
    }
}
