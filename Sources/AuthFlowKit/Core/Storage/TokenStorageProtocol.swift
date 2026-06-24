//
// Copyright (c) 2026 Coderkube Technologies - AuthFLowKit. All rights reserved.
//

import Foundation

public protocol TokenStorageProtocol: Sendable {
    func saveAccessToken(_ token: String) throws
    func saveRefreshToken(_ token: String) throws
    func getAccessToken() throws -> String?
    func getRefreshToken() throws -> String?
    func clearTokens() throws
}

public class KeychainStorage: TokenStorageProtocol, @unchecked Sendable {
    public init() {}
    
    public func saveAccessToken(_ token: String) throws {
        // Implementation for Keychain
    }
    
    public func saveRefreshToken(_ token: String) throws {
        // Implementation for Keychain
    }
    
    public func getAccessToken() throws -> String? {
        // Implementation for Keychain
        return nil
    }
    
    public func getRefreshToken() throws -> String? {
        // Implementation for Keychain
        return nil
    }
    
    public func clearTokens() throws {
        // Implementation for Keychain
    }
}
