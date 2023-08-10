////
////  RemotePlanetDataSourceImpl.swift
////  RickMortyAppLP
////
////  Created by Pagano Leandro Manuel on 10/8/23.
////
//
//import Foundation
//
//
//
//class RemotePlanetDataSourceImpl : PlanetRepoProtocolData{
////    @Published var planet = [Planet]()
//    
//    func loadData(query: String, completion:@escaping ([Planet]) -> ()) {
//        let apiKey = "X+t2C3oaThMdfVoK2jGRpQ==RDhH2ccv0v1gR5ui"
//        let query = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
//        let url = URL(string: "https://api.api-ninjas.com/v1/planets?name="+query!)!
//        
//        var request = URLRequest(url: url)
//        request.setValue(apiKey, forHTTPHeaderField: "X-Api-Key")
//        let task = URLSession.shared.dataTask(with: request) {data, response, error in
//            let planetResponse = try! JSONDecoder().decode([Planet].self, from: data!)
//            //guard let data = data else { return }
//           // print(String(data: data, encoding: .utf8)!)
//            print(planetResponse)
//            
//            DispatchQueue.main.async {
//                completion(planetResponse)
//            }
//        }
//        task.resume()
//    }
//}
