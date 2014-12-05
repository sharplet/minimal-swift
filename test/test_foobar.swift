import Foobar
import XCTest

class FoobarTests: XCTestCase {
  func test_greeting_a_person() {
    let greeting = Greeting(salutation: "Hello")
    let person = Person(name: "World")
    XCTAssertEqual("Hello, World!", greeting.greet(person))
  }
}
