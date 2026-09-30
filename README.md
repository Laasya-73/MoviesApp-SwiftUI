# MoviesApp 🎬

An iOS movie browsing app built with **SwiftUI** and **MVVM**, adapted from a UIKit MovieDB app. Browse movies, view posters and ratings, and search movies by title.

## Features

- Movie list displaying posters, titles, ratings, and overview summaries.
- Search movies by title within the fetched results.
- Restore the full fetched list when the search field is cleared.
- Asynchronous API requests using URLSession and async/await.
- Remote image loading using AsyncImage with placeholder support.
- Reusable SwiftUI components for the screen, list, search bar, and movie cell.

## Tech Stack

| Technology | Purpose |
|-----------|---------|
| Swift | Programming language |
| SwiftUI | User interface |
| MVVM | Separation of UI, data, and presentation logic |
| Protocols | Dependency injection and interchangeable implementations |
| URLSession | Network requests |
| async/await | Asynchronous data fetching |
| Decodable | JSON decoding |
| Identifiable | Movie identity in ForEach |
| AsyncImage | Remote poster loading |
| TMDB API | Movie information and images |

## Architecture

- **Model:** Represents movies and decodes API responses.
- **Network:** Fetches movie data and validates HTTP responses.
- **ViewModel:** Stores movie data and handles search filtering.
- **View:** Displays movies through reusable SwiftUI components.
- **Constants:** Holds shared configuration and constant values.

The screen fetches movies through its view model using `.task`. The view model calls the injected network manager, stores the results, and provides data to the UI.

## SwiftUI Components

| Component | Responsibility |
|-----------|----------------|
| MoviesScreen | Holds the view model and initiates data fetching |
| MovieListView | Displays the heading, search bar, and movie list |
| MovieSearchView | Captures search text through a binding |
| MovieCellView | Displays a movie’s poster, title, rating, and overview |

## Getting Started

1. Clone or download the repository.
2. Open `MoviesAppSwiftUI.xcodeproj` in Xcode.
3. Configure the movie endpoint and your TMDB credentials used by `Constants.movieServerURL`.
4. Select a compatible iOS simulator or connected device.
5. Press **Command + R** to build and run.

## Data Source

Movie information and poster images are provided by **The Movie Database (TMDB)**.
