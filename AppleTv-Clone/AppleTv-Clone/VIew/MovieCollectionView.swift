import SwiftUI

struct MovieCollectionView: View {
    @ObservedObject var moviesViewModel: MovieViewModel
    @ObservedObject var seriesViewModel: SeriesViewModel
    @State var pageTitle = "Assistir Agora"

    @State var sections = ["Mais Populares", "Series", "All Horizontal", "All Vertical"]
    var pageTittle: String = "CollectionViews"
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                HomePosterView(moviesViewModel: moviesViewModel, seriesViewModel: seriesViewModel)
                
                // Section 1
                VStack (alignment: .leading) {
                    HStack {
                        Text("\(sections[0])")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.top, 16)
                            .padding(.leading, 16)
                        
                        NavigationLink(destination: ContentView()) {
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .padding(.top, 16)
                                .font(.title)
                        }
                    }
                    
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 16){
                            ForEach(moviesViewModel.movies) { movie in
                                VStack (alignment: .leading){
                                    Image(movie.imageName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 200, height: 100)
                                        .cornerRadius(10)
                                        .background(Color.gray.opacity(0.4))
                                        .cornerRadius(10)
                                    
                                    Text(movie.title)
                                        .font(.body)
                                    
                                    Text(movie.genre[0])
                                        .font(.body)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                }
                
                // Section 2
                VStack (alignment: .leading) {
                    HStack {
                        Text("\(sections[1])")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.top, 16)
                            .padding(.leading, 16)
                        
                        NavigationLink(destination: ContentView()) {
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .padding(.top, 16)
                                .font(.title)
                        }
                    }
            
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 16) {
                            ForEach(seriesViewModel.series) { series in
                                VStack {
                                    Image(series.imageName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 200, height: 100)
                                        .cornerRadius(10)
                                        .padding(.horizontal, 4)
                                        .background(Color.gray.opacity(0.4))
                                        .cornerRadius(10)
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                }
                
                // Section 3
                VStack (alignment: .leading) {
                    HStack {
                        Text("\(sections[2])")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.top, 16)
                            .padding(.leading, 16)
                        
                        NavigationLink(destination: ContentView()) {
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .padding(.top, 16)
                                .font(.title)
                        }
                    }
                    
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 16) {
                            ForEach(shuffledImages(), id: \.self) { imageName in
                                VStack {
                                    Image(imageName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 260, height: 140)
                                        .cornerRadius(10)
                                        .background(Color.gray.opacity(0.4))
                                        .cornerRadius(10)
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                }
                
                // Section 4
                VStack (alignment: .leading) {
                    HStack {
                        Text("\(sections[3])")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.top, 16)
                            .padding(.leading, 16)
                        
                        NavigationLink(destination: ContentView()) {
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .padding(.top, 16)
                                .font(.title)
                        }
                    }
                    
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
                }.padding(.leading, 8)
                
                
            }
            .onAppear {
                moviesViewModel.fetchMovies()
                seriesViewModel.fetchSeries()
            }
            .ignoresSafeArea()
            .navigationBarTitle(pageTitle)
        }
    }
    
    private func shuffledImages() -> [String] {
        let movies = moviesViewModel.movies.map { $0.imageName }
        let series = seriesViewModel.series.map { $0.imageName }
        let combined = movies + series
        print(combined)
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
