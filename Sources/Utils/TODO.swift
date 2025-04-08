@discardableResult
func TODO<T>(_ reason: String, file: StaticString = #file, line: UInt = #line) -> T {
    fatalError("Not yet implemented: \(reason)")
}
