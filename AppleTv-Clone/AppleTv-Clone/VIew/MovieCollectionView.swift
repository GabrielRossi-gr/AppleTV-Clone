import SwiftUI

struct MovieCollectionView: View {
    @ObservedObject var moviesViewModel: MovieViewModel
    @ObservedObject var seriesViewModel: SeriesViewModel
    
    var pageTittle: String = "CollectionViews"
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack (alignment: .leading) {
                    Text("Movies")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 16)
                        .padding(.leading, 16)
                    
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 16) {
                            ForEach(moviesViewModel.movies) { movie in
                                VStack {
                                    Image(movie.imageName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 108, height: 152)
                                        .cornerRadius(10)
                                    //                                        .padding(.vertical, 8)
                                    //                                        .padding(.horizontal, 4)
                                        .background(Color.gray.opacity(0.4))
                                        .cornerRadius(10)
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                    .onAppear {
                        moviesViewModel.fetchMovies()
                    }
                }
                
                VStack (alignment: .leading) {
                    Text("Series")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 16)
                        .padding(.leading, 16)
                    
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 16) {
                            ForEach(seriesViewModel.series) { series in
                                VStack {
                                    Image(series.imageName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 108, height: 152)
                                        .cornerRadius(10)
                                    //                                        .padding(.vertical, 8)
                                    //                                        .padding(.horizontal, 4)
                                        .background(Color.gray.opacity(0.4))
                                        .cornerRadius(10)
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                    .onAppear {
                        seriesViewModel.fetchSeries()
                    }
                }
                
                VStack (alignment: .leading) {
                    Text("All")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 16)
                        .padding(.leading, 16)
                    
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 16) {
                            ForEach(shuffledImages(), id: \.self) { imageName in
                                VStack {
                                    Image(imageName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 108, height: 152)
                                        .cornerRadius(10)
                                        .background(Color.gray.opacity(0.4))
                                        .cornerRadius(10)
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                    .onAppear {
                        moviesViewModel.fetchMovies()
                        seriesViewModel.fetchSeries()
                    }
                }
                
                VStack (alignment: .leading) {
                    Text("All")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 16)
                        .padding(.leading, 16)
                    
                    ScrollView(.vertical) {
                        LazyVGrid(columns: gridLayout, spacing: 16) {
                            ForEach(shuffledImages(), id: \.self) { imageName in
                                VStack {
                                    Image(imageName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 108, height: 152)
                                        .cornerRadius(10)
                                        .background(Color.gray.opacity(0.4))
                                        .cornerRadius(10)
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                    .onAppear {
                        moviesViewModel.fetchMovies()
                        seriesViewModel.fetchSeries()
                    }
                }
            }
            .navigationTitle(Text("\(pageTittle)"))
        }
    }
    
    private func shuffledImages() -> [String] {
        let movies = moviesViewModel.movies.map { $0.imageName }
        let series = seriesViewModel.series.map { $0.imageName }
        let combined = movies + series
        return combined.shuffled()
    }
    
    private func chunksOfThree<T>(_ array: [T]) -> [[T]] {
        stride(from: 0, to: array.count, by: 3).map {
            Array(array[$0..<min($0 + 3, array.count)])
        }
    }
    
    private let gridLayout = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
}

struct MovieCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        let moviesViewModel = MovieViewModel()
        let seriesViewModel = SeriesViewModel()
        MovieCollectionView(moviesViewModel: moviesViewModel, seriesViewModel: seriesViewModel)
    }
}
