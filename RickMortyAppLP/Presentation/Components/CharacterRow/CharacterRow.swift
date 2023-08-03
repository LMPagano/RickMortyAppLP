//
//  CharacterRow.swift
//  RickMortyAppLP
//
//  Created by Pagano Leandro Manuel on 3/8/23.
//

import SwiftUI

struct CharacterRow: View {
    var character: CharactersNetworkResponseCharacter
    
    init(character: CharactersNetworkResponseCharacter) {
        self.character = character
    }
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: character.image)){ image in
                image.resizable()
                     .cornerRadius(25)
            }placeholder: {
                ProgressView()
            }.frame(width: 50, height: 50)
            VStack(alignment: .leading){
                Text(character.name)
                    .font(.headline)
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
            character: CharactersNetworkResponseCharacter(id: 1, name: "Rick", status: "vivo", species: "Human", type: "Humanos", gender: "masculino", origin: CharactersNetworkResponseCharacterLocation(name: "Lara", url: "pepe"), location: CharactersNetworkResponseCharacterLocation(name: "Lara", url: "pepe"), image: "asdsad", episode: ["1", "2"], url: "creat", created: "hola"))
    }
}
