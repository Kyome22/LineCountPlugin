import Foundation
import PackagePlugin

@main
struct LineCountPlugin: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        [
            .buildCommand(
                displayName: "Line Count",
                executable: try context.tool(named: "LineCounter").url,
                arguments: [
                    context.package.directoryURL.appending(path: "Package.swift").path()
                ],
                outputFiles: []
            )
        ]
    }
}
