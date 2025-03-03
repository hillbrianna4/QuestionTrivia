//
//  TriviaQuestion.swift
//  Trivia
//
//  Created by Mari Batilando on 4/6/23.
//

import UIKit
import Foundation

struct TriviaQuestion : Codable{
  let category: String
  let question: String
  let correct_answer: String
  let incorrect_answers: [String]
}

struct SearchResults: Codable {

    let results: [TriviaQuestion]


}

 
class MythologyAPIService {
    static func fetchQuestion(completion: (([TriviaQuestion])-> Void)? = nil) {
        
        
        
        
        
        
        let urlString = "https://opentdb.com/api.php?amount=10"
        
        
        
        guard let url = URL(string: urlString) else {
            
            print("Invalid URL")
            
            return
            
        }
        
        
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard error == nil else{
                assertionFailure("Error: \(error!.localizedDescription)")
                return
            }
            
            
            guard let data = data else {
                
                print("No data")
                
                return
                
            }
            
            
            
            
            
            do {
                
                let decoder = JSONDecoder()
                
                let searchResults = try decoder.decode(SearchResults.self, from: data)
                
                DispatchQueue.main.async {
                    completion?(searchResults.results)
                }
                    
                } catch {
                    
                    print("error decoding json: \(error)")
                    
                }
                
                        }
            
        task.resume()
        }
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
