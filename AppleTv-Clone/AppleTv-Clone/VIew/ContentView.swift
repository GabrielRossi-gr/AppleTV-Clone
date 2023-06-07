//
//  ContentView.swift
//  MovieAPI
//
//  Created by Pedro Franco on 06/06/23.
//

import SwiftUI

struct ContentView: View {
    
    let movieViewModel = MovieViewModel()
    let seriesViewModel = SeriesViewModel()
    
    var body: some View {
        MovieCollectionView(moviesViewModel: movieViewModel, seriesViewModel: seriesViewModel)
    }
}
