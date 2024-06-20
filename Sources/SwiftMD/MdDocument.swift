//  Created by Axel Ancona Esselmann on 6/18/24.
//

import Foundation

public struct MdDocument {
    public var elements: [MdElement] = []

    public init(elements: [MdElement] = []) {
        self.elements = elements
    }

    public mutating func append(_ text: String) {
        elements.append(text)
    }

    public mutating func append(_ text: String, _ type: MdElementType = .body) {
        elements.append(text, type)
    }

    public mutating func appendRule() {
        elements.appendRule()
    }

    public var content: String {
        elements.mdContent
    }
}
