//
//  Errors.swift
//  iNetwork
//
//  Created by Mohammad on 2025-06-28.
//

import Foundation

enum AppError: LocalizedError, Identifiable {
    var id: String { localizedDescription } // Identifiable for `.alert()`
    case url
    case network
    case decoding
    case unknown

    var errorDescription: String? {
        switch self {
        case .url: return "URL is invalid"
        case .network: return "Network error"
        case .decoding: return "Decoding error"
        case .unknown: return "Something went wrong. Please try again."
        }
    }
}
