//
//  ApiService.swift
//  Submission iOS Pemula
//
//  Created by Tubagus Adhitya Permana on 18/08/22.
//

import Foundation

class ApiService {
    
    private var dataTask: URLSessionDataTask?
    
    func getSportsData(completion: @escaping (Result<SportsData, Error>) -> Void) {
        guard let url = URL(string: "https://www.thesportsdb.com/api/v1/json/2/all_sports.php") else {return}
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(.failure(error))
                print("Data task error \(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                return
            }
            print("Response status code: \(response.statusCode)")
            
            
            guard let data = data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                print(data)
                let jsonData = try decoder.decode(SportsData.self, from: data)
                
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
            } catch let error {
                completion(.failure(error))
            }
        }
        dataTask?.resume()
    }
    
}
