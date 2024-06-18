//  Created by Axel Ancona Esselmann on 6/18/24.
//

import Foundation

public enum MdElementType {
    case header(Int), body, link(URL), rule, quote, codeBlock, image(URL)
}
