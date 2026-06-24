//
// Copyright (c) 2026 Coderkube Technologies - AuthFLowKit. All rights reserved.
//

import SwiftUI

public struct AuthTheme: Sendable {
    public var primaryColor: Color
    public var secondaryColor: Color
    public var backgroundColor: Color
    
    public init(
        primaryColor: Color = .blue,
        secondaryColor: Color = .gray,
        backgroundColor: Color = Color(UIColor.systemBackground)
    ) {
        self.primaryColor = primaryColor
        self.secondaryColor = secondaryColor
        self.backgroundColor = backgroundColor
    }
}
