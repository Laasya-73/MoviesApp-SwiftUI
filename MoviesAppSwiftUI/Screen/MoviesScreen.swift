//
//  MoviesScreen.swift
//  MoviesAppSwiftUI
//
//  Created by Laasya Priya vemuri on 9/30/26.
//

import SwiftUI

struct MoviesScreen: View {
    @State var viewModel: MovieViewModelProtocol

    var body: some View {
        MovieListView(viewModel: $viewModel)
            .task {
                await viewModel.fetchMovies()
            }
    }
}

struct MovieListView: View {
    @Binding var viewModel: MovieViewModelProtocol
    @State var searchText: String = ""

    var body: some View {
        VStack {
            Text("MoviesDB")
                .font(.system(size: 18, weight: .semibold))
                .padding()

            MovieSearchView(searchText: $searchText)

            ScrollView(.vertical, showsIndicators: true) {
                ForEach(viewModel.movies ?? []) { movie in
                    MovieCellView(
                        title: movie.title,
                        description: movie.overview,
                        rating: movie.voteAverage,
                        imageURL: movie.posterPath.map {
                            "https://image.tmdb.org/t/p/w500\($0)"
                        }
                    )
                }
            }
        }
        .onChange(of: searchText) { _, newValue in
            viewModel.searchMovies(with: newValue)
        }
    }
}

struct MovieSearchView: View {
    @Binding var searchText: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)

            TextField("Search movies", text: $searchText)
        }
        .padding(.horizontal, 12)
        .frame(height: 45)
        .background(Color.gray.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.horizontal)
    }
}

struct MovieCellView: View {
    var title: String
    var description: String
    var rating: Double
    var imageURL: String?

    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            if let imageURL, let url = URL(string: imageURL) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 110, height: 170)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 110, height: 170)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    case .failure:
                        placeholderImage
                    @unknown default:
                        placeholderImage
                    }
                }
            } else {
                placeholderImage
            }

            VStack(alignment: .leading, spacing: 12) {
                Text(title)
                    .font(.system(size: 18, weight: .semibold))
                    .lineLimit(3)
                    .fixedSize(horizontal: false, vertical: true)

                HStack(spacing: 4) {
                    Image(systemName: "star.fill")

                    Text(
                        rating,
                        format: .number.precision(.fractionLength(1))
                    )
                }
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.orange)

                Text(description)
                    .font(.system(size: 15, weight: .medium))
                    .lineLimit(4)
                    .fixedSize(horizontal: false, vertical: true)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.gray.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.horizontal)
        .padding(.vertical, 5)
    }

    var placeholderImage: some View {
        Image(systemName: "film")
            .resizable()
            .scaledToFit()
            .frame(width: 110, height: 170)
            .foregroundColor(.gray)
    }
}

#Preview {
    MoviesScreen(viewModel: MovieViewModel(objNetwork: NetworkManager.shared)
    )
}
