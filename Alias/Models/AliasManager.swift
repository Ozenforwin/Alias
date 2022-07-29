//
//  Quiz.swift
//  Alias
//
//  Created by Ilya Vasilev on 29.07.2022.
//

import Foundation
import UIKit
struct AliasManager : Codable {
    let words : [String]
//    init(words : [String]) {
//    self.words = words
//}
    init() { words = [] }
}

 func parse(jsonData: Data) {
    do {
        let decodedData = try JSONDecoder().decode(AliasManager.self,
                                                   from: jsonData)
        
        print("Words in simpleJson", decodedData.words)
        print("===================================")
    } catch {
        print("decode error", error)
    }
}
 func loadJson(fromURLString urlString: String,
                      completion: @escaping (Result<Data, Error>) -> Void) {
    if let url = URL(string: urlString) {
        let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            if let data = data {
                completion(.success(data))
            }
        }
        
        urlSession.resume()
    }
}
let urlString = "https://raw.githubusercontent.com/programmingwithswift/ReadJSONFileURL/master/hostedDataFile.json"


func readLocalFile(forName name: String) -> Data? {
    do {
        if let bundlePath = Bundle.main.path(forResource: name,
                                             ofType: "json"),
            let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
            return jsonData
        }
    } catch {
        print(error)
    }
    
    return nil
}

