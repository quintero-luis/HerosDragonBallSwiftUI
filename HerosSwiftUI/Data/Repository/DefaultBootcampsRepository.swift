//
//  DefaultBootcampsRepository.swift
//  HerosSwiftUI
//
//  Created by Luis Quintero on 03/06/25.
//

import Foundation

final class BootcampsRepository: BootcampsRepositoryProtocol {
    private var network: NetworkBootcampsProtocol
    
    init(network: NetworkBootcampsProtocol) {
        self.network = network
    }
    
    func getBootcamps() async -> [BootcampModel] {
        await network.getBootcamps()
    }
}
