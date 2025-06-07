//
//  AlumnosViewModel.swift
//  HerosSwiftUI
//
//  Created by Luis Quintero on 03/06/25.
//

import Foundation
import Combine

@Observable
final class AlumnosViewModel {
    // Publishers
    var bootcampsData = [BootcampModel]()
    var alumnosData = [AlumnosModel]()
    
    // No Publishers
    // TODO: Investigar 1:47 si es publicador o no, xD
    // Investigar 1:47 si es publicador o no, xD
    private var useCaseAlumnos: AlumnosUseCaseProtocol
    
    // Subsciptors Combine
    @ObservationIgnored
    var suscriptors = Set<AnyCancellable>()
    
    init(useCase: AlumnosUseCaseProtocol = AlumnosUseCase()) {
        self.useCaseAlumnos = useCase
        
        // Call parallely
        Task(priority: .medium) {
            await LoadDataInParallel()
        }
        
        // An observer from combine of NotificationCenter
        NotificationCenter.default
            .publisher(for: .kcNotificationReloadAlumnos)
            .map {
                $0.object as? String
            }
            .sink { _ in
                // Reload heros
                Task {
                    await self.getAlumnos()
                }
            }
            .store(in: &suscriptors)
    }
    
    // Get Classmates
    
    @MainActor
    func getAlumnos() async {
        alumnosData = await useCaseAlumnos.getAlumnos()
    }
    
    // Get Bootcamps
    
    @MainActor
    func getBootcamps() async {
        bootcampsData = await useCaseAlumnos.getBootcamps()
    }
    
    // Load Parallely
    private func LoadDataInParallel() async {
        async let boots: () = getBootcamps() // Void func type
        async let alumni: () = getAlumnos() // Void func type
        
        // excecute both and wait until both finish excecuting
        
        let _ = await (boots, alumni)
    }
    
}
