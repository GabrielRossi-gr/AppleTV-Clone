//
//  HomePosterView.swift
//  AppleTv-Clone
//
//  Created by Pedro Franco on 08/06/23.
//

import SwiftUI

struct HomePosterView: View {
    @ObservedObject var moviesViewModel: MovieViewModel
    @ObservedObject var seriesViewModel: SeriesViewModel
    @State private var currentPage = 0
    @State private var timer: Timer?
    
    let timerInterval = 30.0
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            let movieIndex = min(currentPage, moviesViewModel.movies.count - 1)
            let movie: Movie? = movieIndex >= 0 ? moviesViewModel.movies[movieIndex] : nil
            
            VStack {
                if movieIndex >= 0 {
                    if let movie = movie {
                        Image(movie.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width, height: 760)
                            .clipped()
                            .ignoresSafeArea(.all)
                    }
                }
            }
            
            ZStack(alignment: .bottom) {
                VStack(alignment: .center, spacing: 16) {
                    if let movie = movie {
                        if movieIndex >= 0 {
                            Text(movie.title)
                                .font(.title)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .shadow(color: Color.black.opacity(0.5), radius: 2, x: 0, y: 2)
                        }
                    }
                    HStack {
                        if let movie = movie {
                            if movieIndex >= 0 {
                                Text(movie.genre[0])
                                    .font(.body)
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
                                    .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 2)
                                
                                Text("·")
                                    .font(.body)
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
                                    .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 2)
                                
                                Text(movie.duration)
                                    .font(.body)
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
                                    .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 2)
                                
                                Text("·")
                                    .font(.body)
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
                                    .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 2)
                                
                                Text(movie.ageRating)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
                                    .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 2)
                            }
                        }
                    }
                    
                    VStack {
                        if let movie = movie {
                            if movieIndex >= 0 {
                                Text(movie.description)
                                    .font(.body)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 32)
                                    .shadow(color: Color.black.opacity(0.5), radius: 2, x: 0, y: 2)
                            }
                        }
                    } .padding(.bottom, 8)
                    
                    
                    HStack {
                        ForEach(0..<moviesViewModel.movies.count, id: \.self) { index in
                            Circle()
                                .frame(width: 8, height: 8)
                                .foregroundColor(index == currentPage ? .white : .gray)
                                .opacity(0.8)
                                .scaleEffect(index == currentPage ? 1.2 : 1.0)
                                .animation(.spring())
                                .multilineTextAlignment(.center)
                        }
                    }.padding(.bottom, 16)
                }
                .frame(maxWidth: UIScreen.main.bounds.width)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color(red: 0.173, green: 0.188, blue: 0.216),
                            Color(red: 0.055, green: 0.055, blue: 0.055).opacity(0.2)
                        ]),
                        startPoint: .bottom,
                        endPoint: .top
                    )
                )
            }
            
                        
        }.gesture(DragGesture().onEnded { value in
            let gestureThreshold: CGFloat = 160 // Minimum gesture distance
            
            if value.translation.width < -gestureThreshold {
                // Swiped to the left
                currentPage = (currentPage + 1) % moviesViewModel.movies.count
            } else if value.translation.width > gestureThreshold {
                // Swiped to the right
                currentPage = currentPage > 0 ? currentPage - 1 : moviesViewModel.movies.count - 1
            }
        })
        .onAppear {
            moviesViewModel.fetchMovies()
            seriesViewModel.fetchSeries()
            startTimer()
        }
        .onDisappear {
            stopTimer()
        }
    }
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: timerInterval, repeats: true) { _ in
            withAnimation {
                currentPage = (currentPage + 1) % moviesViewModel.movies.count
            }
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}
