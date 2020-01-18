//
//  SearchResultController.swift
//  Itunes Search
//
//  Created by Kevin Stewart on 1/17/20.
//  Copyright © 2020 Kevin Stewart. All rights reserved.
//

import Foundation

class SearchResultController {
    
    enum HTTPMethod: String {
        case get = "GET"
        case put = "PUT"
        case post = "POST"
        case delete = "DELETE"
    }
    
    
    // MARK: - Properties
    let baseURL = URL(string: "https://itunes.apple.com/search?term=yelp&entity=software")!
    var searchResult: [SearchResult] = []
    var searchResults: SearchResults?
    
    
    
    // MARK: - Methods
    
    func performSearch(searchTerm: String, resultType: ResultType, completion: @escaping () -> Void) {
        var fullRequestURL = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        let searchTermQueryItem = URLQueryItem(name: "search", value: searchTerm)
        fullRequestURL?.queryItems = [searchTermQueryItem]
        
        guard let requestURL = fullRequestURL?.url else {
            print("Error: Request URL is nil!")
            completion()
            return
        }
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.get.rawValue
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
        guard error == nil else {
            print("Error fetching data: \(String(describing: error))")
            completion()
            return
            
         guard let data = data else {
                           
                print("Error: No data returned from data taks!")
                completion()
                return
            }
            
            let jsonDecoder = JSONDecoder()
                       do {
                        let searchResult = try jsonDecoder.decode(SearchResult.self, from: data)
                        self.searchResult = self.searchResults?.results ?? nil!
                        completion()
                       } catch {
                           print("Error: Unable to decode data into object of type [SearchResult]: \(error)")
                       }
                       completion()
            }
            
        }.resume()
    }
    
    
}

