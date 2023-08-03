//
//  HomeView.swift
//  RickMortyAppLP
//
//  Created by Pagano Leandro Manuel on 1/8/23.
//

import SwiftUI

struct HomeView: View {
    
    
    @StateObject private var viewModel: HomeViewModel = HomeViewModel()
    
    var body: some View {
        
        NavigationView{
            VStack{
                switch viewModel.charactersState{
                case .initial:
                    ProgressView()
                case .loading:
                    ProgressView()
                case .error(let error):
                    Text(error)
                case .loaded(let data):
                    ScrollView{
                        ForEach(data.results){ result in
                            CharacterRow(character: result)
                        }
                    }
                }
            }.navigationTitle("Personajes")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
