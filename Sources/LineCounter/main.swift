import ArgumentParser
import Foundation
import LineCounterCore

struct LC: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "lc",
        abstract: "A tool to count the number of lines in the specified file.",
        version: "0.0.1"
    )

    @Argument(help: "The absolute path of a file.")
    var path: String

    mutating func run() throws {
        let count = try LineCounterCore(path: path).count()
        print("\(count)\t\(path)")
    }
}

LC.main()
