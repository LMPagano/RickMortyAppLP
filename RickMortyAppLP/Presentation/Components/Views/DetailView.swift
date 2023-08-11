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
            VStack{
                    AsyncImage(url: URL(string: character.image)){ image in
                        image.resizable()
                        .frame(width: 300, height: 300)
                        .cornerRadius(5)
                        .padding()
                        .accessibilityLabel("Imagen Personaje")
                        }placeholder: {
                        ProgressView()
                        }
                    }.offset(y: -100)
            VStack(alignment: .leading){
                Text(character.name)
                    .bold()
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    }.accessibilityLabel("Nombre Personaje")
            
            VStack(alignment: .leading){
                Text("Origen: \(character.origin)")
                    .font(.title2)
                    .fontWeight(.regular)
                    .accessibilityLabel("Origen Personaje")
                Text("Locacion: \(character.location)")
                    .font(.title2)
                    .fontWeight(.regular)
                    .accessibilityLabel("Locacion Personaje")
                Text("Estado: \(character.status)")
                    .font(.title2)
                    .fontWeight(.regular)
                    .accessibilityLabel("Estado Personaje")
                Text("Especie: \(character.species)")
                    .font(.title2)
                    .fontWeight(.regular)
                    .accessibilityLabel("Especie Personaje")
                Text(character.type)
                    .font(.title3)
                    .fontWeight(.light)
                    .accessibilityLabel("Tipo de Personaje")
                Text("Genero: \(character.gender)")
                    .font(.title2)
                    .fontWeight(.regular)
                    .accessibilityLabel("Genero Personaje")
            }
        }
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

