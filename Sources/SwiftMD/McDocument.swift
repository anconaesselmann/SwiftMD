//  Created by Axel Ancona Esselmann on 6/18/24.
//

import Foundation

public struct McDocument {
    public var elements: [MdElement] = []

    public init(elements: [MdElement] = []) {
        self.elements = elements
    }

    public mutating func append(_ text: String) {
        elements.append(.init(stringValue: text, mdType: .body))
    }

    public mutating func append(_ text: String, _ type: MdElementType = .body) {
        elements.append(.init(stringValue: text, mdType: type))
    }

    public mutating func appendRule() {
        elements.append(.init(stringValue: "", mdType: .rule))
    }

    public var content: String {
        elements.map {
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
