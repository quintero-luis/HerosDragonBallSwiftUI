//
//  HerosSwiftUITests.swift
//  HerosSwiftUITests
//
//  Created by Luis Quintero on 28/05/25.
//

import Testing
@testable import HerosSwiftUI
import Foundation

struct HerosSwiftUITests {

//    @Test func example() async throws {
//        let bootcamp1 = BootcampModel(id: "01", name: "Bootcamp 1")
//        #expect(bootcamp1 != nil)
//    }
    
    @Suite("Domain Testing") struct DomainTests {
        
        // Serialized = Uno a uno, no todo de jalón
        @Suite("Modelos", .serialized) struct ModelTest {
            @Test("Bootcamp Model")
            func modelBootcampTest() async throws {
                let model = BootcampModel(id: "01", name: "Bootcamp 1")
                #expect(model.id == "01")
                #expect(model.name == "Bootcamp 1")
            }
            
            @Test("HeroLikeRequest Model")
            func modelHeroLikeRequestTest() async throws {
                let idHero = UUID().uuidString
                let model = HeroLikeRequest(hero: idHero)
                #expect(model.hero == idHero)
            }
            
            @Test("Heros Model")
            func modelHeroModelRequestTest() async throws {
                let idHero = UUID()
                let model = HerosModel(id: idHero, name: "Hulk", description: "Es muy verde", photo: "photo", favorite: true)
                #expect(model.id == idHero)
                #expect(model.name == "Hulk")
            }
            
            @Test("HerosModelGetInfoFunction")
            func modelHerosFunctionGetInfo() async throws {
                let idHero = UUID()
                let model = HerosModel(id: idHero, name: "Hulk", description: "Es muy verde", photo: "photo", favorite: true)
                #expect(model.getInfoHero() == "Hulk")
//                #expect(model.getInfoHero() == "Heroe: Hulk")
            }
            
            
        }
        
        @Suite("Domain Testing", .serialized)
        struct DomainTest {
            @Test("Propery Wrapper Test")
            func DomainPropertyWrapperTest() async throws {
                @kcPersistenceKeyChain(key: "TEST_KEY") var key
                key = "TEST" // Asigno valor
                #expect(key == "TEST")
                
                let persistKey = KeyChainKC().loadKC(key: "TEST_KEY")
                #expect(key == persistKey)
            }
            
            @Test("Use case login Success", .timeLimit(.minutes(1)))
            func DomainLoginSuccessTest() async throws {
                let loginUseCase = LoginUseCase(repo: DefaultLoginRepositoryMock())
                let response = await loginUseCase.loginApp(user: "TEST", password: "TEST")
                #expect(response == true)
            }
            
            @Test("Use case login Erros Real", .timeLimit(.minutes(1)))
            func DomainLoginErrorTest() async throws {
                let loginUseCase = LoginUseCase(repo: DefaultLoginRepository())
                let response = await loginUseCase.loginApp(user: "TEST", password: "TEST")
                #expect(response == false)
            }
            
            @Test("Use Case Heros Mock")
            func domainHerosUseCaseMockTest() async throws {
                let useCase = HerosUseCaseMock()
                let herosResponse = await useCase.getHeros(filter: "")
                #expect(herosResponse.count == 2)
            }
            
            @Test("Use Case Alumnos")
            func domainAlumnosUseCaseTest() async throws {
                let useCase = NetworkAlumnosMock()
                let herosResponse = await useCase.getAlumnos()
                #expect(herosResponse.count == 129)
            }
            
            
        }
        
        
    } // Suit Domain
    
    
    @Suite("Data Testing", .serialized)
    struct DataTest {
        
        @Suite("Data Local")
        struct DataLocalTests {
            @Test func <#test name#>() async throws {
                // KeyChain
                // Save, Delete, Get
            }
        }
        
        @Suite("Data Network")
        struct DataNetworkTest {
            @Test func DataNetworkModelTest() async throws {
                #expect(Endpoints.login.rawValue == "/auth/login")
                #expect(Endpoints.heros.rawValue == "/heros/all")
                #expect(Endpoints.alumnos.rawValue == "/data/developers")
                
                
                /*
                 case login = "/auth/login"
                 case heros = "/heros/all"
                 case like = "/data/herolike" // Favourite Hero
                 
                 case alumnos = "/data/developers"
                 case bootcamps = "data/bootcamps"
                 */
            }
            
            
            
        }
    } // Suite Data
    
    /*
     Libreria test SwiftUI
     url: https://github.com/nalexn/ViewInspector
     1.= Ver la docu
     2.= Añadir al proyecto SOLO target de Test
     3.= import de ViewInspector
     */
    
    @Suite("Presentation Testing", .serialized)
    struct PresentationTest {
        
        @Test func <#test name#>() async throws {
            <#body#>
        }
    }

}
