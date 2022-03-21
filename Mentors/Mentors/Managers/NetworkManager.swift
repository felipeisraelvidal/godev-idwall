import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    func request<T: Decodable>(of type: T.Type = T.self, url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(type, from: data)
                completion(.success(results))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
}
