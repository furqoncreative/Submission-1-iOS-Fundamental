//
//  ContentView.swift
//  Game Center
//
//  Created by Dicoding Reviewer on 13/08/21.
//

import SwiftUI
import SwiftUIX

struct ListGameView: View {
    @StateObject var viewModel = ListGameViewModel()
    private var gridItemLayout = Array(repeating: GridItem(.flexible(), spacing: 0), count: 2)
    
    var body: some View {
        NavigationView {
            ZStack {
                ColorManager.backgroundColor.ignoresSafeArea( edges: .all)
                Group {
                    if !viewModel.listgame.isEmpty {
                        VStack(spacing: 0.0) {
                            ScrollView {
                                LazyVGrid(columns: gridItemLayout, spacing: 4) {
                                    ForEach(viewModel.listgame) { game in
                                        NavigationLink(
                                            destination: DetailGameView(gameID: game.id),
                                            label: {
                                                ListGameRow(game: game)
                                            })
                                    }
                                }
                                .padding(.all, 10)
                            }
                        }
                    } else {
                        VStack(spacing: 16.0) {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle())
                            Text("Loading...")
                        }
                    }
                }
                
            }
            .navigationTitle("Game Center")
            .navigationSearchBar {
                SearchBar("Find your favorite games", text: $viewModel.keywordSearch, onCommit: {
                    viewModel.searchResult()
                })
                .onCancel {
                    viewModel.clearSearch()
                }
                .searchBarStyle(.default)
            }
            .navigationBarItems(trailing:
                                    NavigationLink(
                                        destination: ProfileScreenView(),
                                        label: {
                                            Image(systemName: "person.circle")
                                                .font(.title)
                                                .foregroundColor(ColorManager.accentColor)
                                        })
            )
            .background(ColorManager.backgroundColor)
        }
        
    }
}

struct ListGameView_Previews: PreviewProvider {
    static var previews: some View {
        ListGameView()
    }
}
