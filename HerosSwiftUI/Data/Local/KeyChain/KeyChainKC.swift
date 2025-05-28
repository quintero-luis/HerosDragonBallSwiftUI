//
//  KeyChainKC.swift
//  HerosSwiftUI
//
//  Created by Luis Quintero on 28/05/25.
//

import Foundation
import Security
import KeychainSwift

public struct KeyChainKC {
    public init() {
    }
        
        // Función para guardar
        
        @discardableResult
        public func saveKC(key: String, value: String) -> Bool {
            if let data = value.data(using: .utf8) {
                return KeychainSwift().set(data, forKey: key)
            } else {
                return false
            }
        }
        
        
        // Cargar clave
        public func loadKC(key: String) -> String? {
            if let data = KeychainSwift().get(key) {
                return data
            } else {
                return ""
            }
        }
        
        // Eliminar
        @discardableResult
        public func deleteKC(key: String) -> Bool {
            return KeychainSwift().delete(key)
        }
        
    
}
