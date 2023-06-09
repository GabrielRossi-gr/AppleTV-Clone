//
//  MovieViewModel.swift
//  MovieAPI
//
//  Created by Pedro Franco on 06/06/23.
//

import SwiftUI

class SeriesViewModel: ObservableObject {
    @Published var series: [Series] = []
    
    // aqui eu faco a requisicao na API
    func fetchSeries() {
        series = [
                Series(id: 0, title: "SerieSample0", imageName: "s0", genre: ["Policial", "Crime"]),
                Series(id: 1, title: "SerieSample1", imageName: "s1", genre: ["Romance", "Viagem"]),
                Series(id: 2, title: "SerieSample2", imageName: "s2", genre: ["Comida", "Mastercheff"]),
                Series(id: 3, title: "SerieSample3", imageName: "s3", genre: ["Policial", "Crime"]),
                Series(id: 4, title: "SerieSample4", imageName: "s4", genre: ["Medicos", "Doutores"]),
                Series(id: 5, title: "SerieSample5", imageName: "s5", genre: ["Aventura", "Ficção Cientifica"])
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
