//
//  HomeView.swift
//  RickMortyAppLP
//
//  Created by Pagano Leandro Manuel on 1/8/23.
//

import SwiftUI


struct HomeView: View {
    // 6/8 cambie de StateObject a ObservedObjet
    @ObservedObject private var homeViewModel: HomeViewModel = HomeViewModel()
    @State var busqueda = ""
    @State private var showGreeting = true
    
    var body: some View {
        
        NavigationView{
            VStack{
                switch homeViewModel.charactersState{
                case .initial:
                    ProgressView()
                case .loading:
                    ProgressView()
                case .error:
                    Text("Error")
                case .loaded:
                    ScrollView{
                        ForEach(homeViewModel.filteredCharacters){ result in
                            NavigationLink(destination: DetailView(character: result)) {
                                CharacterRow(character: result)
                                
                            }.buttonStyle(PlainButtonStyle()) // saca lo azul de los links
                            }
                        }
                    }
            }.onAppear(){homeViewModel.onLoad()}
            .navigationTitle("Wiki Rick y Morty")
  
            .navigationBarItems(
                  trailing: Button(action: {}, label: {
                     NavigationLink(destination: LoginView()) {
                          Text("Log Out")
                     }
                  }))
            
            
            
            
            
            
            
            
//            .navigationBarItems(trailing:
//
//            Button(action: {
//
//
//                        print("Log out")
//                    }, label: {
//                        Text("Log out")
//                    })
//
//
//            )
                
            }.searchable(text: $busqueda).onChange(of: busqueda) { busqueda in  homeViewModel.searchCharacter(textoABuscar: busqueda)
            }
        }
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView(busqueda: "Busca personaje")
            
        }
    }
    

