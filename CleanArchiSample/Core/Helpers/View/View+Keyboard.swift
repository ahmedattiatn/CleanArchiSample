//
//  View+Keyboard.swift
//  CleanArchiSample
//
//  Created by Ahmed Atia on 15/11/2025.
//

import SwiftUI

#if canImport(UIKit)
    extension View {
        func hideKeyboard() {
            UIApplication
                .shared
                .sendAction(
                    #selector(UIResponder.resignFirstResponder),
                    to: nil,
                    from: nil,
                    for: nil
                )
        }
    }
#endif
