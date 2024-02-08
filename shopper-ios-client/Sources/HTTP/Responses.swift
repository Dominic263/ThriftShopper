//
//  File.swift
//
//  Created by DOMINIC NDONDO on 2/8/24.
//
import Foundation

public struct LoginResponseDTO : Codable {
    public let error: Bool
    public var reason: String?
    public var token: String
    public var uid: UUID
}

public struct RegistrationResponseDTO: Codable {
    public let error: Bool
    public var reason: String?
}

extension RegistrationResponseDTO: Equatable { }
extension LoginResponseDTO: Equatable { }
