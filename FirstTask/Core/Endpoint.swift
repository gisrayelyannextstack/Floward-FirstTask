//
//  Endpoint.swift
//  FirstTask
//
//  Created by Gerasim Israyelyan on 13.11.22.
//

import Foundation

protocol Endpoint {
    var baseURL: URL { get }
    var path: String { get }
}

// MARK: - URL

enum RequestGenerationError: Error {
    case components
}

extension Endpoint {
    func url() throws -> URL {
        let baseURL = baseURL.absoluteString.last != "/" ? baseURL.absoluteString + "/" : baseURL.absoluteString
        let endpoint = baseURL.appending(path)

        guard var urlComponents = URLComponents(string: endpoint) else { throw RequestGenerationError.components }
        
        guard let url = urlComponents.url else { throw RequestGenerationError.components }
        return url
    }
}
