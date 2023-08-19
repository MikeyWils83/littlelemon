//
//  DishesError.swift
//  LittleLemonCapstoneMW
//
//  Created by Michael Wilson on 8/8/23.
//

import Foundation

enum DishesError: Error {
    case missingData
    case networkError
    case unexpectedError(error: Error)
}

extension DishesError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .missingData:
            return NSLocalizedString("Found and will discard a dish missing data.", comment: "")
        case .networkError:
            return NSLocalizedString("Error fetching dish data over the network.", comment: "")
        case .unexpectedError(let error):
            return NSLocalizedString("Received unexpected error. \(error.localizedDescription)", comment: "")
        }
    }
}
