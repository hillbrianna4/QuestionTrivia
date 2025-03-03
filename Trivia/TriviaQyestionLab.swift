//
//  TriviaQyestionLab.swift
//  Trivia
//
//  Created by user268373 on 2/25/25.
//

import UIKit

 

struct Mythology: Decodable {

    let category: String

    let question: String

    let correct_answer: String
    
    let incorrect_answer: String

}

 

struct SearchResults: Decodable {

    let results: [Mythology]

    let resultCount: Int

}

 

func fetchMythology(searchTerm: String) {

    

    searchTerm.replacingOccurrences(of: " ", with: "+")

    

    let urlString = "https://opentdb.com/api.php?amount=10&category=20&difficulty=medium&type=multiple"

    

    guard let url = URL(string: urlString) else {

        print("Invalid URL")

        return

    }

    

    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in

        if let error = error {

            print("Error fetching data: \(error)")

            return

        }

        

        

        guard let data = data else {

            print("No data")

            return

        }

        

        

        do {

            let decoder = JSONDecoder()

            let searchResults = try decoder.decode(SearchResults.self, from: data)

            

            print("There are \(searchResults.resultCount) songs matching your search")

            

            for mythology in searchResults.results {

                print("\(mythology.category) by \(mythology.question)")

            }

        } catch {

            print("error decoding json: \(error)")

        }

    

    }

    

    task.resume()

    

}

 

 
func main(){
    fetchMythology(searchTerm: "In Greek Mythology, who killed Achilles?")
}

