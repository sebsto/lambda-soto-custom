import SotoCore
import SotoLambdaMinimalSDK

public func listAllFunctions() async throws {
    let client = AWSClient()
    let lambda = Lambda(client: client)

    do {
        let response = try await lambda.listFunctions()
        for function in response.functions ?? [] {
            print(function.functionName ?? "unknown")
        }
    } catch {
        try await client.shutdown()
        throw error
    }
    try await client.shutdown()
}

@main struct Main {
    static func main() async throws {
        try? await listAllFunctions()
    }
}
