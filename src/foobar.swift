public typealias Salutation = String

public struct Person {
  public let name: String

  public init(name: String) {
    self.name = name
  }
}

public struct Greeting {
  public let salutation: Salutation

  public init(salutation: Salutation) {
    self.salutation = salutation
  }

  public func greet(person: Person) -> String {
    return "\(salutation), \(person.name)!"
  }
}
