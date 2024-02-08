//
//  HTTPClient.swift
//  
//  Created by DOMINIC NDONDO on 2/8/24.
import Foundation
import ComposableArchitecture

//Defines the routes used on the client-side of the application
public struct HTTPClient {
    public var login: @Sendable (String, String)  async throws -> LoginResponseDTO
    public var register: @Sendable (String, String)  async throws -> RegistrationResponseDTO
}

//Extends the HTTPClient to create a generic function to load resources
extension HTTPClient {
    static private func load<T: Codable>(_ resource: Resource<T>) async throws -> T {
        
        var request = URLRequest(url: resource.url)
        
        switch resource.method {
        case .get(let queryItems):
            var components = URLComponents(url: resource.url, resolvingAgainstBaseURL: false)
            components?.queryItems = queryItems
            guard let url = components?.url else {
                throw NetworkError.badRequest
            }
            
            request = URLRequest(url: url)
            
        case .post(let data):
            request.httpMethod = resource.method.name
            request.httpBody = data
            
        case .delete:
            request.httpMethod = resource.method.name
        }
        
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["Content-Type":"application/json"]
        let session = URLSession(configuration: configuration)
        
        let (data, response) = try await session.data(for: request)
        
        guard let _ = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard let result = try? JSONDecoder().decode(resource.modelType, from: data) else {
            throw NetworkError.decodingError
        }
        
        return result
    }
}
    
extension HTTPClient: DependencyKey {
    public static var liveValue: Self {
        return Self(
            login: {
                let loginInfo = ["username": $0, "password": $1]
                let resource = try Resource(url: URL(string: Routes.login)!, method: .post(JSONEncoder().encode(loginInfo)), modelType: LoginResponseDTO.self)
                
                return try await load(resource)
            },
            
            register: {
                let registrationInfo = ["username": $0, "password": $1]
                let resource = try Resource(url: URL(string: Routes.register)!, method: .post(JSONEncoder().encode(registrationInfo)), modelType: RegistrationResponseDTO.self)
                
                return try await load(resource)
            }
        )
    }
    
}

extension DependencyValues {
  public var httpClient: HTTPClient {
    get { self[HTTPClient.self] }
    set { self[HTTPClient.self] = newValue }
  }
}
