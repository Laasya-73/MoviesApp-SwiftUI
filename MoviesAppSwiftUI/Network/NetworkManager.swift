//
//  NetworkManager.swift
//  MoviesAppSwiftUI
//
//  Created by Laasya Priya vemuri on 9/30/26.
//

import Foundation

//MARK: - Network Protocol

protocol NetworkProtocol {
    func fetchDataFrom(serverURL: String) async -> [Movie]?
}

class NetworkManager: NetworkProtocol {
    
    // MARK: - Properties
    
    static let shared = NetworkManager()
    
    private init() { }
    
    // MARK: - Network Call
    
    func fetchDataFrom(serverURL: String) async -> [Movie]? {
        guard let serverURL = URL(string: serverURL) else {
            return nil
        }
        
        let request = URLRequest(url: serverURL)
        
        do {
            let (jsonData, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                return nil
            }
            
            let movieResponse = try JSONDecoder().decode(MovieResponse.self, from: jsonData)
            return movieResponse.results
        } catch {
            print("Log:: Failed to fetch or decode news data")
            return nil
        }
    }
}
