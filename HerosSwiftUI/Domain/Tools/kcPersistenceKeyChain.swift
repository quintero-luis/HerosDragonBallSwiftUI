//
//  kcPersistenceKeyChain.swift
//  HerosSwiftUI
//
//  Created by Luis Quintero on 02/06/25.
//

import Foundation

// It cannot be public bacause of the wrapper
@propertyWrapper
class kcPersistenceKeyChain {
    private var key: String
    
    init(key: String) {
        self.key = key
    }
    
    var wrappedValue: String {
        get {
            if let value = KeyChainKC().loadKC(key: key) {
                return value
            } else {
                return ""
            }
        }
        
        set {
            // Me asignan un valor
            KeyChainKC().saveKC(key: key, value: newValue)
        }
    }
}
