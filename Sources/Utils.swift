import DiscordBM

@discardableResult
func TODO<T>(_ reason: String, file: StaticString = #file, line: UInt = #line) -> T {
    fatalError("Not yet implemented: \(reason) (at \(file):\(line))")
}

func TODO(_ reason: String, file: StaticString = #file, line: UInt = #line) {
    let _: ExpressibleByNilLiteral = TODO(reason, file: file, line: line)
}

extension DiscordUser {
    var tag: String {
        let suffix = self.discriminator == "0000" ? "" : "#\(self.discriminator)"
        return "\(self.username)\(suffix)"
    }
}
