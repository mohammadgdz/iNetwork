//
//  Errors.swift
//  iNetwork
//
//  Created by Mohammad on 2025-06-28.
//

import Foundation
enum AppError: LocalizedError, Identifiable {
    var id: String { localizedDescription } // Identifiable for `.alert()`

    case network(description: String)
    case decoding(description: String)
    case unknown

    var errorDescription: String? {
        switch self {
        case .network(let description),
             .decoding(let description):
            return description
        case .unknown:
            return "Something went wrong. Please try again."
        }
    }
}
