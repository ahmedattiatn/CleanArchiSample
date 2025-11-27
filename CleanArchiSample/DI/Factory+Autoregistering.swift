//
//  Factory+Autoregistering.swift
//  CleanArchiSample
//
//  Created by Ahmed Atia on 15/11/2025.
//

import Factory

extension Container: @retroactive AutoRegistering {
    public func autoRegister() {
        HomeDependencies.autoRegister(self)
    }
}
