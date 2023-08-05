//
//  CharacterRow.swift
//  RickMortyAppLP
//
//  Created by Pagano Leandro Manuel on 3/8/23.
//

import SwiftUI

struct CharacterRow: View {
    var character: Character
    
    init(character: Character) {
        self.character = character
    }
    
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: character.image)){ image in
                image.resizable()
                    .frame(width: 80, height: 80)
                     .cornerRadius(5)
            }placeholder: {
                ProgressView()
            }.frame(width: 80, height: 80)
            VStack(alignment: .leading){
                Text(character.name)
                    .font(.title)
                    .fontWeight(.medium)
                Text(character.gender)
                    .font(.subheadline)
                    .fontWeight(.regular)
                
            }.frame( maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            Text(character.species)
                .font(.footnote)
                .fontWeight(.light)
        }.padding()
    }
}

struct CharacterRow_Previews: PreviewProvider {
    static var previews: some View {
        CharacterRow(
            character: Character(id: 1, name: "Personaje", species: "Especie", gender: "Genero", image:"https://rickandmortyapi.com/api/character/avatar/94.jpeg"))
    }
}
