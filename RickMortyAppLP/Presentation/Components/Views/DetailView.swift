//
//  DetailView.swift
//  RickMortyAppLP
//
//  Created by Pagano Leandro Manuel on 6/8/23.
//

import SwiftUI

struct DetailView: View {
    
    var character: Character
    init(character: Character) {
        self.character = character
    }
    
    var body: some View {
        
        VStack{
            AsyncImage(url: URL(string: character.image)){ image in
                image.resizable()
                    .frame(width: 200, height: 200)
                    .cornerRadius(5)
                    .padding(20)
            }placeholder: {
                ProgressView()
            }//.frame(width: 80, height: 80)
            VStack(alignment: .leading){
                Text(character.name)
                    .bold()
                    .font(.title)
                    .fontWeight(.medium)
                Text(character.gender)
                    .font(.subheadline)
                    .fontWeight(.regular)
                Text(character.origin)
                    .font(.subheadline)
                    .fontWeight(.regular)
                Text(character.location)
                    .font(.subheadline)
                    .fontWeight(.regular)
                Text(character.status)
                    .font(.subheadline)
                    .fontWeight(.regular)
                Text(character.type)
                    .font(.subheadline)
                    .fontWeight(.regular)
                Text(character.gender)
                    .font(.subheadline)
                    .fontWeight(.regular)
                Text(character.species)
                    .font(.footnote)
                    .fontWeight(.light)
            
                
            }.frame( maxWidth: .infinity, maxHeight: .infinity)
        }.padding()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(character: Character(id: 1,
            name: "Personaje",
            species: "Especie",
            gender: "Genero",
            image:"https://rickandmortyapi.com/api/character/avatar/94.jpeg",
            origin: "Origen",
            location:"lugar",
            status: "Status",
            type: "Type"))
    }
}

