# SotoLambdaMinimalSDK

A minimal, code-generated Swift SDK for AWS Lambda. Instead of pulling in the full Soto Lambda package, this project uses the Soto code generator to produce only the API surface you actually need — right now that's `invoke` and `listFunctions`.

It's built on top of [soto-core](https://github.com/soto-project/soto-core) and uses the [soto-codegenerator](https://github.com/soto-project/soto-codegenerator) plugin to turn the AWS service model into Swift code at build time. The result is a small, static library you can link into your own projects without dragging along every Lambda operation under the sun.

## Getting started

Add the package as a dependency in your `Package.swift`:

```swift
.package(url: "<your-repo-url>", from: "0.1.0")
```

Then depend on the `SotoLambdaMinimalSDK` library from your target.

## Choosing which operations to include

Edit `Sources/SotoLambdaMinimalSDK/soto.config.json`. The `operations` array controls what gets generated. Add or remove operation names there and rebuild — the code generator takes care of the rest.

## Requirements

- Swift 6.2+
- macOS 15+

## License

See the project license for details.
