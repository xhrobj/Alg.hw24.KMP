public func example(of description: String, action: () -> Void) {
    print("\n\(description):\n")
    action()
    print()
}
