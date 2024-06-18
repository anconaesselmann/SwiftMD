//  Created by Axel Ancona Esselmann on 6/18/24.
//

import Foundation

public struct MdElement {
    public init(stringValue: String, mdType: MdElementType) {
        self.stringValue = stringValue
        self.mdType = mdType
    }
    public let stringValue: String
    public let mdType: MdElementType

    static func h(_ stringValue: String, size: Int) -> Self {
        .init(stringValue: stringValue, mdType: .header(size))
    }
}
