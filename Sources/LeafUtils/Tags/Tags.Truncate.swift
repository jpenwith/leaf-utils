//
//  Tags.Truncate
//
//
//  Created by me on 24/02/2024.
//

import Foundation
import Leaf


public extension Tags {
    struct Truncate {}
}

extension Tags.Truncate: LeafTag {
    public func render(_ ctx: LeafContext) throws -> LeafData {
        guard ctx.parameters.count == 3 else {
            throw Error.wrongNumberOfParameters(ctx.parameters.count)
        }

        guard let string = ctx.parameters[0].string else {
            throw Error.badParameter(ctx.parameters[0], String.self)
        }

        guard let length = ctx.parameters[1].int else {
            throw Error.badParameter(ctx.parameters[1], Int.self)
        }

        guard let suffix = ctx.parameters[2].string else {
            throw Error.badParameter(ctx.parameters[2], String.self)
        }

        return LeafData.string(
            (string.count > length) ? (string.prefix(length) + suffix) : (string)
        )
    }
}


public extension Tags.Truncate {
    enum Error: Swift.Error {
        case wrongNumberOfParameters(Int)
        case badParameter(LeafData, Any.Type)
    }
}
