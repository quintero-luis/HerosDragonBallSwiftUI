//
//  DefaultAlumnosRepository.swift
//  HerosSwiftUI
//
//  Created by Luis Quintero on 03/06/25.
//

import Foundation

// Real & Mock by Dependency Injection
final class AlumnosRepository: AlumnosRepositoryProtocol {
    
    private var network: NetworkAlumnosProtocol
    
    init(network: NetworkAlumnosProtocol) {
        self.network = network
    }
    
    func getAlumnos() async -> [AlumnosModel] {
        await network.getAlumnos()
    }
}
