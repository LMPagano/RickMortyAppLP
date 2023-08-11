//
//  PlanetViewModel.swift
//  RickMortyAppLP
//
//  Created by Pagano Leandro Manuel on 10/8/23.
//

import Foundation

  
 struct Planet:Identifiable ,Codable, Hashable{
     var id = UUID()
     var name: String
     var mass, radius: Double
     var period: Int
     var semi_major_axis: Double
     var temperature: Int
     var distance_light_year: Double
     var host_star_mass, host_star_temperature: Int
 }
    






class PlanetViewModel : ObservableObject{
    @Published var planet = [Planet]()
    
    func loadData(query: String, completion:@escaping ([Planet]) -> ()) {
        let apiKey = "X+t2C3oaThMdfVoK2jGRpQ==RDhH2ccv0v1gR5ui"
        let query = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: "https://api.api-ninjas.com/v1/planets?name="+query!)!
        
        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "X-Api-Key")
        URLSession.shared.dataTask(with: request) {data, response, error in
            let planet = try! JSONDecoder().decode([Planet].self, from: data!)
            //guard let data = data else { return }
           // print(String(data: data, encoding: .utf8)!)
            print(planet)
            
            DispatchQueue.main.async {
                completion(planet)
            }
        }.resume()
    }
}


