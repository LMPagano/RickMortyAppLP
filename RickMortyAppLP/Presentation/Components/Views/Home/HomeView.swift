//
//  HomeView.swift
//  RickMortyAppLP
//
//  Created by Pagano Leandro Manuel on 1/8/23.
//
import SwiftUI

struct HomeView: View {
    
    @ObservedObject private var homeViewModel: HomeViewModel = HomeViewModel()
    @State var busqueda = ""

    var body: some View {
        TabView() {
            NavigationView{
                VStack{
                    VStack{
                        Text(homeViewModel.showQOfCharacters() ?? "").font(.caption)
                            .rotation3DEffect(.degrees(25), axis: (x: 1, y: 0, z: 0))
                        .shadow(color: .gray, radius: 2, x: 0, y: 5)
                    }.offset(x: -150)
                    switch homeViewModel.charactersState{
                    case .initial:
                        ProgressView()
                    case .loading:
                        ProgressView()
                    case .error:
                        Text("Error")
                    case .loaded:
                        ScrollView(.vertical){
                            ForEach(homeViewModel.filteredCharacters){ result in
                                NavigationLink(destination: DetailView(character: result)) {
                                    CharacterRow(character: result)
                                }.buttonStyle(PlainButtonStyle()) // Saca lo azul de hipervinculo de los links
                            }
                        }
                    }
                }.accessibilityLabel("Grouping Container")
                .onAppear(){homeViewModel.onLoad()}
                .navigationTitle("Wiki Rick y Morty")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: Button(action: {}, label: {NavigationLink(destination:LoginView().navigationBarBackButtonHidden(true)){Text("Log Out")}}))
            }.searchable(text: $busqueda).onChange(of: busqueda) { busqueda in  homeViewModel.searchCharacter(textoABuscar: busqueda)}.accessibilityLabel("Buscador de personajes")
                .accessibilityHint("busca personaje")
            .tabItem {Image(systemName: "sparkles")
                        Text("Personajes")}.tag(0)
                        NavigationView{
                        ConfigView(configViewModel: ConfigViewModel())
            }.tabItem {Image(systemName: "gear")
                    Text("Configuracion")}.tag(1)
 
        }.accessibilityLabel("Wiki Rick y Morty")
            .accessibilityAddTraits(.isHeader)
    }
}
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView(busqueda: "Busca personaje")
            
        }
    }
    

