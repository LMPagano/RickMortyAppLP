////
////  RootView.swift
////  RickMortyAppLP
////
////  Created by Pagano Leandro Manuel on 6/8/23.
////
//
import SwiftUI
import Combine















//
//enum UserStateError: Error{
//    case signInError
//    case signOutError
//}
//
//@MainActor
//class RootViewModel: ObservableObject {
//    
//    @Published var isLoggedIn = false
//    @Published var isBusy = false
//    
//    func signIn() async -> Result<Bool, UserStateError>  {
//        
//        isBusy = true
//        do{
//            try await Task.sleep(nanoseconds:  1_000_000_000)
//            isLoggedIn = true
//            isBusy = false
//            return .success(true)
//        }catch{
//            isBusy = false
//            return .failure(.signInError)
//        }
//    }
//    
//    func signOut() async -> Result<Bool, UserStateError>  {
//        isBusy = true
//        do{
//            try await Task.sleep(nanoseconds: 1_000_000_000)
//            isLoggedIn = false
//            isBusy = false
//            return .success(true)
//        }catch{
//            isBusy = false
//            return .failure(.signOutError)
//        }
//    }
//}



//enum StatusViews {
//    case none
//    case loading
//    case loaded
//    case error(error: String)
//}
//
//final class RootViewModel: ObservableObject {
//
//    // MARK: - Properties
//    let loginViewModel: LoginViewModel
//    @Published var status = StatusViews.none
//    private var subscribers = Set<AnyCancellable>()
//
//
//    init(loginViewModel: LoginViewModel) {
//        self.loginViewModel = loginViewModel
//    }
//
//    func authenticate(user: String, password: String) {
//    // Set status to loading
//        status = .loading
//
//        loginViewModel.authenticate(user: user, pass: password)
//            .sink{ completion in
//                switch completion {
//                case .failure(_): // NO ES NINGUNA TONTERÍA PONERLE _ PORQUE SI NO TE CHILLA EL COMPILADOR
//                    print("Error while login")
//                    self.status = .error(error: "Error while login")
//                case .finished:
//                    print("Login finished")
//                    self.status = .loaded
//                }
//            } receiveValue: { (user, Password) in
//                print((user, Password))
//            }.store(in: &subscribers)
//    }
//}
//
//
//
