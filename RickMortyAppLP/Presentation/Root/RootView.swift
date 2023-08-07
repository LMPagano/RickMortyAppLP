////
////  RootView.swift
////  RickMortyAppLP
////
////  Created by Pagano Leandro Manuel on 6/8/23.
////
//

























//import SwiftUI
//
//@main
//struct RootView: App {
//    
//    @StateObject var rootViewModel = RootViewModel()
//    
//    var body: some Scene {
//        WindowGroup {
//            NavigationView{
//                ApplicationSwitcher()
//            }
//            .navigationViewStyle(.stack)
//            .environmentObject(rootViewModel)
//        }
//    }
//}
//
//struct ApplicationSwitcher: View {
//    
//    @EnvironmentObject var vm: RootViewModel
//    
//    var body: some View {
//        if (vm.isLoggedIn) {
//                HomeView()
//        } else {
//            LoginView()
//        }
//        
//    }
//}


//struct Recoveryview_Previews: PreviewProvider {
//    static var previews: some View {
//        RootView()
//    }
//}


//import SwiftUI
//import Combine
//
//struct RootView: View {
//
//    // MARK: - Properties
//    @EnvironmentObject var rootViewModel: RootViewModel
//
//
//    var body: some View {
//
//        switch (rootViewModel.status) {
//
//        case StatusViews.none:
//            LoginView()
//
//        case StatusViews.loading:
//            ProgressView()
//
//        case StatusViews.error(error: let errorString):
//            Text("Error \(errorString)")
//
//        case StatusViews.loaded:
//                HomeView()
//            }
//        }
//    }
//
//
//struct RootView_Previews: PreviewProvider {
//    static var previews: some View {
//        RootView()
//    }
//}
