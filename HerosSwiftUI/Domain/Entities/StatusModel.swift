//
//  StatusModel.swift
//  HerosSwiftUI
//
//  Created by Luis Quintero on 28/05/25.
//

import Foundation

enum Status {
    case none, loading, loaded, register, error(error: String)
}
