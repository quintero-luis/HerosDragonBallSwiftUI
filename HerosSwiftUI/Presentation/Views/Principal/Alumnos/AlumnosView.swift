//
//  AlumnosView.swift
//  HerosSwiftUI
//
//  Created by Luis Quintero on 03/06/25.
//

import SwiftUI

struct AlumnosView: View {
    @State var vm: AlumnosViewModel
    @State private var selectedAlumno: AlumnosModel? = nil
    
    init(vm: AlumnosViewModel = AlumnosViewModel()) {
        self.vm = vm
    }
    
    var body: some View {
        ScrollView {
            ForEach(vm.bootcampsData) { bootcamp in
                
                // Get classmates from bootcamp
                let alumnosboot = vm.alumnosData.filter({$0.bootcamp.id == bootcamp.id})
                
                // if for Empty Bootcamps
                
                if alumnosboot.count > 0 {
                    VStack {
                        // Title bootcamp
                        Text(bootcamp.name)
                            .font(.title2)
                            .foregroundStyle(.orange)
                            .bold()
                        // Alumnos
                        ScrollView(.horizontal, showsIndicators: false) {
                            // Lazy so we only load the ones appearing on screen
                            LazyHStack {
                                ForEach(alumnosboot) { alumno in
                                    AlumnosRowView(data: alumno)
                                    // For doble tap
                                        .onTapGesture(count: 2) {
                                            print("Doble tap")
                                            selectedAlumno = alumno // Selected alumni
                                        }
                                }
                            }
                        }
                    } // VStack
                } // if
            } // ForEach 1
        } // ScrollView
        .sheet(item: $selectedAlumno) { alumno in
            VStack {
                AlumnoFavoritesView(data: alumno)
            }
        }
    }
}

#Preview {
    AlumnosView(vm: AlumnosViewModel(useCase: AlumnosUseCaseMock()))
}
