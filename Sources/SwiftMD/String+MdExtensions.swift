//  Created by Axel Ancona Esselmann on 6/18/24.
//

import Foundation

public extension String {
    func h(_ size: Int) -> String {
        "\(Array(repeating: "#", count: min(1, max(5, size))).joined()) \(self)"
    }

    func l(_ url: URL) -> String {
        "[\(self)](\(url.absoluteString))"
    }

    func bold() -> String {
        "**\(self)**"
    }

    func italic() -> String {
        "*\(self)*"
    }

    func italicWhenNested() -> String {
        "_\(self)_"
    }

    func boldAndItalic() -> String {
        "***\(self)***"
    }

    func sub() -> String {
        "<sub>\(self)</sub>"
    }

    func sup() -> String {
        "<sup>\(self)</sup>"
    }

    func quote() -> String {
        "`\(self)`"
    }

    func quoteBlock() -> String {
        split(separator: "\n")
            .map { "> \($0)" }
            .joined(separator: "\n")
    }

    func codeBlock() -> String {
        "\n```\(self)```\n"
    }
}
