//
//  AppInfo.swift
//  CleanArchiSample
//
//  Created by Ahmed Atia on 15/11/2025.
//

import Foundation

// MARK: - AppInfo

struct AppInfo {
    // MARK: Lifecycle

    private init() {}

    // MARK: Internal

    static var shared = AppInfo()

    var apiBaseUrl: String {
        readFromInfoPlist(withKey: "ApiBaseUrl") ?? "[Required] Info.plist missing ApiBaseUrl"
    }

    var apiKey: String {
        readFromInfoPlist(withKey: "ApiKey") ?? "[Required] Info.plist missing ApiKey"
    }

    // MARK: Private

    /// lets hold a reference to the Info.plist of the app as Dictionary
    private let infoPlistDictionary = Bundle.main.infoDictionary
}

extension AppInfo {
    /// Retrieves and returns associated values (of Type String) from info.Plist of the app.
    private func readFromInfoPlist(withKey key: String) -> String? {
        infoPlistDictionary?[key] as? String
    }

    /// Retrieves and returns associated values (of Type String) from info.Plist of the app.
    private func readDictFromInfoPlist(withKey key: String) -> NSDictionary? {
        infoPlistDictionary?[key] as? NSDictionary
    }
}
