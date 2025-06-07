//
//  AlumnosUseCase.swift
//  HerosSwiftUI
//
//  Created by Luis Quintero on 03/06/25.
//

import Foundation

protocol AlumnosUseCaseProtocol {
    var repoAlumnos: AlumnosRepositoryProtocol { get set }
    var repoBootcamps: BootcampsRepositoryProtocol { get set }
    
    func getAlumnos() async -> [AlumnosModel]
    
    func getBootcamps() async -> [BootcampModel]
    
    
}

// Real

final class AlumnosUseCase: AlumnosUseCaseProtocol {
    var repoAlumnos: AlumnosRepositoryProtocol
    
    var repoBootcamps: BootcampsRepositoryProtocol
    
    init(
        repoAlumnos: AlumnosRepositoryProtocol = AlumnosRepository(network: NetworkAlumnos()),
        repoBootcamps: BootcampsRepositoryProtocol = BootcampsRepository(network: NetworkBootcamps())) {
            self.repoAlumnos = repoAlumnos
            self.repoBootcamps = repoBootcamps
        }
    
    func getAlumnos() async -> [AlumnosModel] {
        await repoAlumnos.getAlumnos()
    }
    
    func getBootcamps() async -> [BootcampModel] {
        await repoBootcamps.getBootcamps()
    }
}

// Mock
final class AlumnosUseCaseMock: AlumnosUseCaseProtocol {
    var repoAlumnos: AlumnosRepositoryProtocol
    
    var repoBootcamps: BootcampsRepositoryProtocol
    
    init(
        repoAlumnos: AlumnosRepositoryProtocol = AlumnosRepository(network: NetworkAlumnosMock()),
        repoBootcamps: BootcampsRepositoryProtocol = BootcampsRepository(network: NetworkBootcampsMock())) {
            self.repoAlumnos = repoAlumnos
            self.repoBootcamps = repoBootcamps
        }
    
    func getAlumnos() async -> [AlumnosModel] {
        await repoAlumnos.getAlumnos()
    }
    
    func getBootcamps() async -> [BootcampModel] {
        await repoBootcamps.getBootcamps()
    }
}
