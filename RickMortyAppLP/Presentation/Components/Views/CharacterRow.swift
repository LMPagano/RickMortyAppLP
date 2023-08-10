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
                         .frame(width: 95, height: 95)
                         .cornerRadius(12)
                 }placeholder: {
                     ProgressView()
                 }
                 
                 VStack{
                     Text(character.name)
                         .padding(.trailing)
                         .font(.title)
                         .fontWeight(.medium)
                    //Spacer()
                     VStack{
                         Text(character.origin)
                             .font(.subheadline)
                             .fontWeight(.light)
                         Text(character.species)
                             .font(.subheadline)
                             .fontWeight(.regular)
                     }
                 }.frame( maxWidth: .infinity, maxHeight: .infinity)

             }.padding()
             .frame(width: .infinity, height: 120, alignment: .leading)
     }
 }

 struct CharacterRow_Previews: PreviewProvider {
     static var previews: some View {
         CharacterRow(
             character: Character(id: 1,
                                  name: "Personaje",
                                  species: "Especie",
                                  gender: "Genero",
                                  image:"https://rickandmortyapi.com/api/character/avatar/94.jpeg", origin: "tierra",
                                  location:"lugar",
                                  status: "live",
                                  type: "tipo"))
     }
 }




