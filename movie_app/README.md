# Movie App

A movie app built using Flutter that allows users to browse trending, upcoming, and top-rated movies, search for movies, and view movie details.

## Features

- View trending, upcoming, and top-rated movies
- Search for movies by title
- View movie details such as title, release date, and poster image

## Screenshots

![Screenshot 1](screenshots/screenshot1.png)
![Screenshot 2](screenshots/screenshot2.png)
![Screenshot 3](screenshots/screenshot3.png)

## Getting Started

To run this app on your local machine, you'll need to have Flutter installed. If you haven't already, you can follow the instructions on the official Flutter website to get started: [Flutter Installation](https://flutter.dev/docs/get-started/install)

Once you have Flutter installed, clone this repository and run the following command in the terminal to install the required dependencies:


Then, run the app on an emulator or physical device with the following command:


## Dependencies

This app uses the following dependencies:

- `dio` - for making API requests to fetch movie data
- `cached_network_image` - for caching and displaying movie poster images
- `carousel_slider` - for displaying a carousel of trending movies
- `bloc` and `flutter_bloc` - for state management using the BLoC pattern
- `equatable` - for simplifying the implementation of equality checks for state objects
- `connectivity_plus` - for checking internet connectivity status
- `shared_preferences` - for storing and retrieving theme mode (light/dark) using shared preferences

## Contributing

If you find any issues with the app or have suggestions for improvement, feel free to open an issue or submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

