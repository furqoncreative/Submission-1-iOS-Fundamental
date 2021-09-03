//
//  GameDetailViewModel.swift
//  Game Center
//
//  Created by Dicoding Reviewer on 20/08/21.
//

import Foundation

class DetailGameViewModel: ObservableObject {
    @Published var game: DetailGame?
    @Published var gameID: Int?
    @Published var isLoading = false
    func getGameDetail() {
        guard let gameID = gameID else { return }
        isLoading = true
        let urlString = Constant().baseUrl+Constant().gamesPath+"/\(gameID)"
        ApiService.shared.getData(from: urlString) { (result: Result<DetailGame, ErrorCase>, _) in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let data) :
                    self.game = data
                case .failure(let error) :
                    print(error.localizedDescription)
                }
            }
        }
    }
}
