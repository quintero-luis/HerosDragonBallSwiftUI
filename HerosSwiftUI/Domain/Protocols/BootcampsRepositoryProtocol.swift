//
//  BootcampsRepositoryProtocol.swift
//  HerosSwiftUI
//
//  Created by Luis Quintero on 03/06/25.
//

import Foundation

protocol BootcampsRepositoryProtocol {
    func getBootcamps() async ->  [BootcampModel]
}
