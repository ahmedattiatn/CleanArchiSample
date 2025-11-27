//
//  CopiloteRadius.swift
//  CleanArchiSample
//
//  Created by Ahmed Atia on 15/11/2025.
//

import Foundation

public enum CopiloteRadius: CGFloat, CaseIterable {
    /// No spacing (0 pt)
    case none = 0
    /// xtiny spacing (8 pts)
    case xtiny = 8
    /// tiny spacing (12 pts)
    case tiny = 12
    /// medium spacing (16 pts)
    case medium = 16
    /// big spacing (18 pts)
    case big = 18

    // MARK: Public

    public func callAsFunction() -> CGFloat {
        rawValue
    }
}
