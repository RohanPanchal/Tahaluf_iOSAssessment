//
//  APICall.swift
//  Tahaluf_iOSAssessment
//
//  Created by Rohan Panchal on 05/06/24.
//

import Foundation

class APIService {
    static let shared = APIService()
    private init() {}

    func fetchUniversities(completion: @escaping (Result<[University], Error>) -> Void) {
        guard let url = URL(string: "http://universities.hipolabs.com/search?country=United%20Arab%20Emirates") else {
            completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                }
                return
            }

            do {
                let universities = try JSONDecoder().decode([University].self, from: data)
                completion(.success(universities))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
