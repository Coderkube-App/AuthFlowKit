//
// Copyright (c) 2026 Coderkube Technologies - AuthFLowKit. All rights reserved.
//

import Foundation

public class SessionManager: ObservableObject {
    public static let shared = SessionManager()
    
    @Published public var isAuthenticated: Bool = false
    
    private var storage: TokenStorageProtocol
    private var apiClient: AuthAPIClientProtocol?
    
    public init(storage: TokenStorageProtocol = KeychainStorage()) {
        self.storage = storage
        checkSession()
    }
    
    public func setAPIClient(_ client: AuthAPIClientProtocol) {
        self.apiClient = client
    }
    
    public func checkSession() {
        if let token = try? storage.getAccessToken(), !token.isEmpty {
            isAuthenticated = true
        } else {
            isAuthenticated = false
        }
    }
    
    public func startSession(tokens: AuthTokenResponse) {
        try? storage.saveAccessToken(tokens.accessToken)
        try? storage.saveRefreshToken(tokens.refreshToken)
        
        DispatchQueue.main.async {
            self.isAuthenticated = true
        }
    }
    
    public func endSession() {
        try? storage.clearTokens()
        
        DispatchQueue.main.async {
            self.isAuthenticated = false
        }
    }
}
