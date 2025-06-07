//
//  LoginRepositoryProtocol.swift
//  HerosSwiftUI
//
//  Created by Luis Quintero on 02/06/25.
//

import Foundation

protocol LoginRepositoryProtocol {
    func loginApp(user: String, password: String) async -> String // Returns JWT Token
}
