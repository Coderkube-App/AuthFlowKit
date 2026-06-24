//
// Copyright (c) 2026 Coderkube Technologies - AuthFLowKit. All rights reserved.
//

import Foundation

public struct AuthConfig: Sendable {
    public var baseURL: URL
    public var loginEndpoint: String
    public var signupEndpoint: String
    public var forgotPasswordEndpoint: String
    public var resetPasswordEndpoint: String
    
    public init(
        baseURL: URL,
        loginEndpoint: String = "/login",
        signupEndpoint: String = "/signup",
        forgotPasswordEndpoint: String = "/forgot-password",
        resetPasswordEndpoint: String = "/reset-password"
    ) {
        self.baseURL = baseURL
        self.loginEndpoint = loginEndpoint
        self.signupEndpoint = signupEndpoint
        self.forgotPasswordEndpoint = forgotPasswordEndpoint
        self.resetPasswordEndpoint = resetPasswordEndpoint
    }
}

public class AuthFlowKitManager: @unchecked Sendable {
    public static let shared = AuthFlowKitManager()
    
    public var config: AuthConfig?
    
    private init() {}
    
    public func configure(with config: AuthConfig) {
        self.config = config
    }
}
