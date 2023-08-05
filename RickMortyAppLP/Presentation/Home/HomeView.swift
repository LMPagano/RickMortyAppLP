//
//  HomeView.swift
//  RickMortyAppLP
//
//  Created by Pagano Leandro Manuel on 1/8/23.
//

import SwiftUI


struct HomeView: View {
    @StateObject private var homeViewModel: HomeViewModel = HomeViewModel()
    @State var busqueda = ""
    
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
                            CharacterRow(character: result)
                        }
                    }
                }
            }.navigationTitle("Wiki Rick y Morty")
            .onAppear(){homeViewModel.onLoad()}
            
        }.searchable(text: $busqueda).onChange(of: busqueda) { busqueda in  homeViewModel.searchCharacter(textoABuscar: busqueda)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(busqueda: "Busca personaje")

    }
}
