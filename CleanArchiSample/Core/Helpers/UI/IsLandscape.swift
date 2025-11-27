//
//  IsLandscape.swift
//  CleanArchiSample
//
//  Created by Ahmed Atia on 15/11/2025.
//

import SwiftUI

@propertyWrapper
public struct IsLandscape: DynamicProperty {
    // MARK: Lifecycle

    public init() {}

    // MARK: Public

    public var wrappedValue: Bool {
        verticalSizeClass == .compact || horizontalSizeClass == .regular
    }

    // MARK: Private

    @Environment(\.verticalSizeClass) private var verticalSizeClass
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
}
