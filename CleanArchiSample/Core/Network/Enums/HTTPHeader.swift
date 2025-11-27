//
//  HTTPHeader.swift
//
//
//  Created by Ahmed Atia on 15/11/2025.
//

import Foundation

// MARK: - HTTPHeader

public enum HTTPHeader: String {
    case applicationJson = "application/json"
    case contentType = "Content-Type"
    case accept = "Accept"

    // MARK: Internal

    var value: String { rawValue }
}

// MARK: - HTTPMethod

public enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
}
