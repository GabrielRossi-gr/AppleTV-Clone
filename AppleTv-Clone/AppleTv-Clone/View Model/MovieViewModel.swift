//
//  MovieViewModel.swift
//  MovieAPI
//
//  Created by Pedro Franco on 06/06/23.
//

import SwiftUI

class MovieViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    
    // aqui eu faco a requisicao na API
    func fetchMovies() {
        movies = [
                Movie(id: 0, title: "Swat", imageName: "m0", genre: ["Ação", "Tiro", "Policial"]),
                Movie(id: 1, title: "2012", imageName: "m1", genre: ["Ficção Cientifica", "Aventura", "Catastrofes"]),
                Movie(id: 2, title: "Blasted", imageName: "m2", genre: ["Samba Canção", "Verticalismo", "Policial"]),
                Movie(id: 3, title: "Den of Thieves", imageName: "m3", genre: ["Ação", "Tiro", "Policial"]),
                Movie(id: 4, title: "Nobody Knows Me", imageName: "m4", genre: ["Ação", "Terror", "Aventura"]),
                Movie(id: 5, title: "Sentinelle", imageName: "m5", genre: ["Ação", "Tiro", "Policial"])
            ]
        
//        guard let url = URL(string: "YOUR_API_URL_HERE") else { return }
//
//            URLSession.shared.dataTask(with: url) { data, response, error in
//                if let error = error {
//                    print("Error: \(error.localizedDescription)")
//                    return
//                }
//
//                guard let data = data else {
//                    print("No data received")
//                    return
//                }
//
//                // Parse the data into an array of Movie objects
//                do {
//                    let decoder = JSONDecoder()
//                    let moviesData = try decoder.decode([Movie].self, from: data)
//                    DispatchQueue.main.async {
//                        self.movies = moviesData
//                    }
//                } catch {
//                    print("Error decoding data: \(error.localizedDescription)")
//                }
//            }.resume()
    }
}
