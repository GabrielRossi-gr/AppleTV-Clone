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
        Movie(id: 0, title: "Tittle1", imageName: "p0", genre: ["Ação"], duration: "2 h e 14 min", ageRating: "12", description: "movie 1 description, movie 1 description, movie 1 description."),
        Movie(id: 1, title: "Tittle2", imageName: "p1", genre: ["Ficção Cientifica"], duration: "2 h e 14 min", ageRating: "12", description: "movie 2 description, movie 2 description, movie 2 description."),
        Movie(id: 2, title: "Tittle3", imageName: "p2", genre: ["Policial"], duration: "1 h e 23 min", ageRating: "16", description: "movie 3 description, movie 3 description, movie 3 description."),
        Movie(id: 3, title: "Tittle4", imageName: "p3", genre: ["Comedia"], duration: "4 h e 08 min", ageRating: "14", description: "movie 4 description, movie 4 description, movie 4 description."),
        Movie(id: 4, title: "Tittle5", imageName: "p4", genre: ["Aventura"], duration: "3 h e 27 min", ageRating: "18", description: "movie 5 description, movie 5 description, movie 5 description."),
        Movie(id: 5, title: "Tittle6", imageName: "p5", genre: ["Tiro"], duration: "1 h e 34 min", ageRating: "L", description: "movie 6 description, movie 6 description, movie 6 description."),
        Movie(id: 6, title: "Tittle7", imageName: "p6", genre: ["Comedia"], duration: "1 h e 34 min", ageRating: "12", description: "movie 7 description, movie 7 description, movie 7 description."),
        Movie(id: 7, title: "Tittle8", imageName: "p7", genre: ["Brasileiro"], duration: "1 h e 34 min", ageRating: "12", description: "movie 8 description, movie 8 description, movie 8 description."),
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
