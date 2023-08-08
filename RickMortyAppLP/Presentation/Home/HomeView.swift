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
        TabView() {
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
                }
                .onAppear(){homeViewModel.onLoad()}
                .navigationTitle("Wiki Rick y Morty")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: Button(action: {}, label: {
                                     NavigationLink(destination:LoginView().navigationBarBackButtonHidden(true))
                                    {Text("Log Out")}}))
                
            }.searchable(text: $busqueda).onChange(of: busqueda) { busqueda in  homeViewModel.searchCharacter(textoABuscar: busqueda)}
            .tabItem {Image(systemName: "sparkles")
                        Text("Personajes")}.tag(0)
            NavigationView{
                ConfigView()
            }.tabItem {Image(systemName: "gear")
                    Text("Configuracion")}.tag(1)
        }
    }
}
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView(busqueda: "Busca personaje")
            
        }
    }
    

