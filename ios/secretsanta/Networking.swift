import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif



struct user: Codable, Hashable {
    var name: String
    var interests: [String]
    var instructions: String
    var lat: Double
    var long: Double
}

func register(appState: AppState, interests: [ChipModel], textFieldContent: String, lat: Double, lon: Double) {
    
    let parameters = user(name: "Kalevi", interests: interests.map {$0.chipName}, instructions: textFieldContent, lat: lat, long: lon )
    let encoder = JSONEncoder()
    
    let data = try! encoder.encode(parameters)
    let postData = data
    
    var request = URLRequest(url: URL(string: "https://junction.mikroni.fi/user/register")!,timeoutInterval: Double.infinity)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    request.httpMethod = "POST"
    request.httpBody = postData
    
    struct Reg: Decodable { // or Decodable
        let success: Bool
        let message: String
        let user: String
    }

    URLSession.shared.dataTask(with: request) { data, response, error in
        if let data = data {
            do {
                
                let arr = try JSONDecoder().decode(Reg.self, from: data)
                
                appState.user = arr.user
              } catch let error {
                 print(error)
              }
        }

    }.resume()
    
}
