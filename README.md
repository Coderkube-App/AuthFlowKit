# AuthFlowKit

`AuthFlowKit` is a fully configurable authentication framework for Apple platforms using SwiftUI. It provides UI, state management, session handling, and networking hooks to integrate with any backend API.

It supports:

- Complete UI flows: Login, Signup, Forgot Password, Reset Password, OTP
- Dynamic API configuration (works with any REST API)
- Form validation and reusable form components
- Secure session management and token storage (Keychain/UserDefaults)
- Generic networking layer integration points
- Social authentication hooks (Sign in with Apple, Google)
- Biometric authentication hooks (Face ID, Touch ID)
- Light/Dark mode support
- Accessibility and localization-ready

## Requirements

- iOS 15+
- macOS 12+
- Swift 6.2+

## Installation

### Swift Package Manager

In Xcode:

1. Go to **File > Add Packages...**
2. Enter your repository URL for `AuthFlowKit`
3. Select the version/range and add the package

Or in `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/Coderkube-App/AuthFlowKit.git", from: "1.0.0")
],
targets: [
    .target(
        name: "YourApp",
        dependencies: [
            .product(name: "AuthFlowKit", package: "AuthFlowKit")
        ]
    )
]
```

## Package Structure

```text
AuthFlowKit/
 ├── Sources/AuthFlowKit/
 │   ├── Core/       (Network, Storage, Security)
 │   ├── Data/       (Models, Repositories)
 │   ├── Domain/     (Entities, UseCases)
 │   └── Presentation/ (Screens, ViewModels)
 ├── Tests/AuthFlowKitTests/
 └── Package.swift
```

## Usage

### Configuration

You can configure `AuthFlowKit` with your custom endpoints, storage providers, and API clients:

```swift
import AuthFlowKit

let config = AuthConfig(
    baseURL: URL(string: "https://api.example.com")!,
    loginEndpoint: "/auth/login",
    signupEndpoint: "/auth/signup"
)

AuthFlowKitManager.shared.configure(with: config)
```

### Displaying Login

```swift
import SwiftUI
import AuthFlowKit

struct RootView: View {
    @StateObject var session = SessionManager.shared
    
    var body: some View {
        if session.isAuthenticated {
            MainAppView()
        } else {
            LoginView(
                onLoginSuccess: {
                    print("Logged in")
                },
                onForgotPassword: {
                    // Navigate to forgot password
                }
            )
        }
    }
}
```

## Testing

Run tests:

```bash
swift test
```

## Automated Versioning

This repository uses a GitHub Actions workflow to automatically create version tags and GitHub Releases after changes are merged into `main`.

Version bump rules:

- `fix:` or other non-breaking commits -> patch bump (`x.y.Z`)
- `feat:` -> minor bump (`x.Y.0`)
- `BREAKING CHANGE` in the commit body or footer -> major bump (`X.0.0`)

## Design Notes

- Clean Architecture principles applied
- Reusable UI components
- Storage agnostic (Keychain abstraction provided)

## License

This project is licensed under the MIT License.
