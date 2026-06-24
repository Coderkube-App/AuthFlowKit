//
// Copyright (c) 2026 Coderkube Technologies - AuthFLowKit. All rights reserved.
//

import SwiftUI

public struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isLoading = false
    @State private var errorMessage: String?
    
    private let theme: AuthTheme
    private let onLoginSuccess: () -> Void
    private let onForgotPassword: () -> Void
    
    public init(
        theme: AuthTheme = AuthTheme(),
        onLoginSuccess: @escaping () -> Void,
        onForgotPassword: @escaping () -> Void
    ) {
        self.theme = theme
        self.onLoginSuccess = onLoginSuccess
        self.onForgotPassword = onForgotPassword
    }
    
    public var body: some View {
        VStack(spacing: 20) {
            Text("Login")
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 20)
            
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            if let error = errorMessage {
                Text(error)
                    .foregroundColor(.red)
                    .font(.footnote)
            }
            
            Button(action: onForgotPassword) {
                Text("Forgot Password?")
                    .font(.footnote)
                    .foregroundColor(theme.primaryColor)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            
            Button(action: login) {
                if isLoading {
                    ProgressView()
                } else {
                    Text("Sign In")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(theme.primaryColor)
                        .cornerRadius(8)
                }
            }
            .disabled(isLoading || email.isEmpty || password.isEmpty)
        }
        .padding()
        .background(theme.backgroundColor)
    }
    
    private func login() {
        isLoading = true
        errorMessage = nil
        
        // Mock authentication process
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            isLoading = false
            if email == "test@test.com" && password == "password" {
                SessionManager.shared.startSession(tokens: AuthTokenResponse(accessToken: "access_123", refreshToken: "refresh_123"))
                onLoginSuccess()
            } else {
                errorMessage = "Invalid credentials. Try test@test.com / password"
            }
        }
    }
}

#Preview {
    LoginView(
        onLoginSuccess: {},
        onForgotPassword: {}
    )
}
