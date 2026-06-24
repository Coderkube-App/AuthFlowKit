//
// Copyright (c) 2026 Coderkube Technologies - AuthFLowKit. All rights reserved.
//

import Foundation

public protocol AuthAPIClientProtocol: Sendable {
    func login(credentials: [String: Any]) async throws -> AuthTokenResponse
    func signup(userData: [String: Any]) async throws -> AuthTokenResponse
    func refresh(refreshToken: String) async throws -> AuthTokenResponse
    func logout() async throws
}

public struct AuthTokenResponse: Codable, Sendable {
    public let accessToken: String
    public let refreshToken: String
    
    public init(accessToken: String, refreshToken: String) {
        self.accessToken = accessToken
        self.refreshToken = refreshToken
    }
}
