import Foundation

guard CommandLine.arguments.count == 2 else {
    print("usage: lc [absolute path of a file]")
    exit(1)
}

let fileURL = URL(fileURLWithPath: CommandLine.arguments[1])
guard let file = try? String(contentsOf: fileURL, encoding: .utf8) else {
    print("Error: could not read \(fileURL.absoluteString)")
    exit(2)
}

print(file.components(separatedBy: CharacterSet.newlines).count)
