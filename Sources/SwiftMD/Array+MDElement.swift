//  Created by Axel Ancona Esselmann on 6/20/24.
//

import Foundation

public extension Array where Element == MdElement {
    mutating func append(_ text: String) {
        append(.init(stringValue: text, mdType: .body))
    }

    mutating func append(_ text: String, _ type: MdElementType = .body) {
        append(.init(stringValue: text, mdType: type))
    }

    mutating func appendRule() {
        append(.init(stringValue: "", mdType: .rule))
    }

    var mdContent: String {
        map {
            switch $0.mdType {
            case .header(let size):
                return $0.stringValue.h(size)
            case .body:
                return $0.stringValue
            case .link(let url):
                return $0.stringValue.l(url)
            case .rule:
                return "---"
            case .quote:
                return $0.stringValue.quoteBlock()
            case .codeBlock:
                return $0.stringValue.codeBlock()
            case .image(let url):
                return "!\($0.stringValue.l(url))"
            }
        }.joined(separator: "\n\n")
    }
}
