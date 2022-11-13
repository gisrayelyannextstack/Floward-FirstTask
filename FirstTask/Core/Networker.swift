//
//  Networker.swift
//  FirstTask
//
//  Created by Gerasim Israyelyan on 13.11.22.
//

import Foundation
import Combine

class Networker {
    func request<T: Decodable>(endpoint: Endpoint) -> AnyPublisher<T, Error> {
        guard let url = try? endpoint.url() else {
            return Fail(error: NetworkError.badURL).eraseToAnyPublisher()
        }
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap() { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
