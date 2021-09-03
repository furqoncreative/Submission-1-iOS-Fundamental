//
//  Constant.swift
//  Game Center
//
//  Created by Dicoding Reviewer on 20/08/21.
//

import Foundation

struct Constant {
    let baseUrl = "https://api.rawg.io/api"
    let gamesPath = "/games"
     
    var apiKey: String {
        get {
            guard let filePath = Bundle.main.path(forResource: "GameCenter", ofType: "plist") else {
                fatalError("Couldn't find file 'GameCenter.plist'.")
            }

            let plist = NSDictionary(contentsOfFile: filePath)
            guard let value = plist?.object(forKey: "API_KEY") as? String else {
                fatalError("Couldn't find key 'API_KEY' in 'GameCenter.plist'.")
            }
    
            if value.starts(with: "_") {
                fatalError("Erro")
            }
            return value
        }
    }
    
}
