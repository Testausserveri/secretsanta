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

func register(interests: [ChipModel], textFieldContent: String, lat: Double, lon: Double) {
    var semaphore = DispatchSemaphore (value: 0)
    
    let parameters = user(name: "Kalevi", interests: interests.map {$0.chipName}, instructions: textFieldContent, lat: lat, long: lon )
    let encoder = JSONEncoder()
    
    let data = try! encoder.encode(parameters)
    let postData = data
    
    //print(String(data: postData, encoding: .utf8)!)
    
    var request = URLRequest(url: URL(string: "https://792b-2001-708-40-2003-af83-346a-793c-bb37.eu.ngrok.io/user/register")!,timeoutInterval: Double.infinity)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    request.httpMethod = "POST"
    request.httpBody = postData
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data else {
            print(String(describing: error))
            semaphore.signal()
            return
        }
        var data2: Data = Data(String(data: data, encoding: .utf8)!.utf8)
        let json = try! JSONSerialization.jsonObject(with: data2, options: [])
        
        
        semaphore.signal()
    }
    
    task.resume()
    semaphore.wait()
}
