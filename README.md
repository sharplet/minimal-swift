# A minimal Swift project

**Note: This project was created as a proof of concept. These days you should probably be using [swift-package-manager](https://github.com/apple/swift-package-manager) and [swift-corelibs-xctest](https://github.com/apple/swift-corelibs-xctest).**

Demonstrates using the `swiftc` compiler to create a pure swift module, link
it into an executable, and run tests using XCTest.

## Usage

    $ rake -T
    rake clean   # Clean build products
    rake foobar  # Build the Foobar module
    rake main    # Build the main program
    rake test    # Build and run the tests
