//
//  Constants.swift
//
//  Created by DOMINIC NDONDO on 2/8/24.

import Foundation

public enum NetworkError: Error {
    case badRequest
    case serverError(String)
    case decodingError
    case invalidResponse
    case unauthorized
}

extension NetworkError: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
            case .badRequest:
                return NSLocalizedString("Unable to perform request", comment: "badRequestError")
            case .serverError(let errorMessage):
                return NSLocalizedString(errorMessage, comment: "serverError")
            case .decodingError:
                return NSLocalizedString("Unable to decode successfully.", comment: "decodingError")
            case .invalidResponse:
                return NSLocalizedString("Invalid response", comment: "invalidResponse")
        case .unauthorized:
            return NSLocalizedString("Unauthorized", comment: "Password is incorrect. Please try again")
        }
    }
}

public struct Resource<T: Codable> {
    public let url: URL
    public var method: HTTPMethod
    public var modelType: T.Type
}

public enum HTTPMethod {
    case get([URLQueryItem])
    case post(Data?)
    case delete
    
    public var name: String {
        switch self {
            case .get:
                return "GET"
            case .post:
                return "POST"
            case .delete:
                return "DELETE"
        }
    }
}
