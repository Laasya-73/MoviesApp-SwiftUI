//
//  MovieViewModel.swift
//  MoviesAppSwiftUI
//
//  Created by Laasya Priya vemuri on 9/30/26.
//

import SwiftUI

//MARK: - MovieDB ViewModel Protocol

protocol MovieViewModelProtocol: AnyObject, Observable {
    var movies: [Movie]? { get set }
    func fetchMovies() async
    func getTotalMovieCount() -> Int
    func getMovie(for index: Int) -> Movie?
    func searchMovies(with searchText: String)
    func resetSearch()
}

//MARK: - MovieDB ViewModel

@Observable
class MovieViewModel: MovieViewModelProtocol {
    
    //MARK: - Properties
    
    var movies: [Movie]?
    let objNetwork: NetworkProtocol?
    
    private var allMovies: [Movie] = []
    
    init(objNetwork: NetworkProtocol? = nil) {
        self.objNetwork = objNetwork
    }
}
                            
// MARK: - Network Methods

extension MovieViewModel {
    func fetchMovies() async {
        let fetchedMovies = await objNetwork?.fetchDataFrom(serverURL: Constants.movieServerURL.rawValue)
        allMovies = fetchedMovies ?? []
        movies = fetchedMovies
    }
}


// MARK: - Helper Methods

extension MovieViewModel {
    func getTotalMovieCount() -> Int {
        movies?.count ?? 0
    }
    
    func getMovie(for index: Int) -> Movie? {
        guard let movies = movies, movies.indices.contains(index) else {
            return nil
        }
        return movies[index]
    }
}

// MARK: - Search Methods

extension MovieViewModel {
    func searchMovies(with searchText: String) {
        let query = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !query.isEmpty else {
            resetSearch()
            return
        }
        movies = allMovies.filter { $0.title.localizedCaseInsensitiveContains(query) }
    }

    func resetSearch() {
        movies = allMovies
    }
}



