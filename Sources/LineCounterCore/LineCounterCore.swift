import Foundation

public struct LineCounterCore {
    var fileURL: URL

    public init(path: String) {
        fileURL = URL(fileURLWithPath: path)
    }

    public func count() throws -> Int {
        guard let file = try? String(contentsOf: fileURL, encoding: .utf8) else {
            throw LineCounterError.couldNotRead(fileURL.absoluteString)
        }

        return file.components(separatedBy: CharacterSet.newlines).count
    }
}

enum LineCounterError: LocalizedError {
    case couldNotRead(String)

    var errorDescription: String? {
        switch self {
        case let .couldNotRead(path):
            "Could not read \(path)"
        }
    }
}
