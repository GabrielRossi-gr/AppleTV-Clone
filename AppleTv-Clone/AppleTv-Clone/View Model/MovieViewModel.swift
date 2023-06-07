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
                Movie(id: 0, title: "MovieSample0", imageName: "m0"),
                Movie(id: 1, title: "MovieSample1", imageName: "m1"),
                Movie(id: 2, title: "MovieSample2", imageName: "m2"),
                Movie(id: 3, title: "MovieSample3", imageName: "m3"),
                Movie(id: 4, title: "MovieSample4", imageName: "m4"),
                Movie(id: 5, title: "MovieSample5", imageName: "m5")
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
