//
//  Tags.Round
//
//
//  Created by me on 20/03/2024.
//

import Foundation
import Leaf


public extension Tags {
    struct Round {}
}

extension Tags.Round: LeafTag {
    public func render(_ ctx: LeafContext) throws -> LeafData {
        guard ctx.parameters.count == 2 else {
            throw Error.wrongNumberOfParameters(ctx.parameters.count)
        }

        guard let number = ctx.parameters[0].double else {
            throw Error.badParameter(ctx.parameters[0], Double.self)
        }

        guard let places = ctx.parameters[1].int else {
            throw Error.badParameter(ctx.parameters[0], Int.self)
        }

        return LeafData.string(String(format: "%.\(places)f", number))
    }
}


public extension Tags.Round {
    enum Error: Swift.Error {
        case wrongNumberOfParameters(Int)
        case badParameter(LeafData, Any.Type)
    }
}
