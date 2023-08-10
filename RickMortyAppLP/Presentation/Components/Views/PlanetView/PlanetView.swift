//
//  PlanetView.swift
//  RickMortyAppLP
//
//  Created by Pagano Leandro Manuel on 10/8/23.
//

import SwiftUI


struct PlanetView: View {
    
    @State var planet = [Planet]()
    @State var query: String = ""
    
    init(){
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    func getPlanet() {
        PlanetViewModel().loadData(query: self.query) { (planet) in
            self.planet = planet
        }
    }
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.red, Color.purple]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.vertical)
            .overlay(
                VStack(alignment: .leading) {
                    VStack {
                        TextField(
                            "Enter some Planet",
                            text: $query
                        )
                        .multilineTextAlignment(.center)
                        .font(Font.title.weight(.light))
                        .foregroundColor(Color.white)
                        .padding()
                        HStack {
                            Spacer()
                            Button(action: getPlanet) {
                                Text("Get Nutrition")
                                    .padding()
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 50)
                                            .stroke(Color.white, lineWidth: 2)
                                    )
                            }
                            .font(.title2)
                            .foregroundColor(Color.white)
                            Spacer()
                        }
                    }
                    .padding(30.0)
                    List {
                        ForEach(planet, id:\.self) { elem in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("\(elem.name)")
                                        .font(.title)
                                        .padding(.bottom)
                               
                                }
                                .minimumScaleFactor(0.01)
                                Spacer()
                                VStack(alignment: .trailing) {
                                    Text("mass: \(elem.mass, specifier: "%.1f")g")
                                    Text("Radius: \(elem.radius, specifier: "%.1f")g")
                                    Text("Period: \(elem.period, specifier: "%.1f")g")
                                    Text("semiMayorAxis: \(elem.semi_major_axis, specifier: "%.1f")g")
                                    Text("Temperature: \(elem.temperature, specifier: "%.1f")mg")
                                }
                                .minimumScaleFactor(0.01)
                                .font(.system(size: 18.0))
                            }
                            .listRowBackground(Color.clear)
                            .foregroundColor(.black)
                            .padding()
                        }
                    }
                }
            )
    }
}


struct PlanetView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetView()
    }
}
