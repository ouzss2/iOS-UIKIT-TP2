# Movie Viewer App 🎥  

A **UIKit-based iOS application** that displays a list of popular movies, their posters, and detailed descriptions. This project demonstrates the use of **UITableView**, **NavigationController**, and basic data binding in UIKit.

## Features ✨  
- **Movie List View**: Displays a scrollable list of movies with their posters and titles, fetched dynamically from a remote API.  
- **Movie Details View**: Shows a movie's poster, title, and description in a detailed view upon selection.  
- **Clean Navigation**: Smooth transition between the list and detail views using a navigation controller.
- **Networking**: Retrieves movie data using URLSession.

## Screenshots 📸  
### Movie List Screen  
![Simulator Screenshot - iPhone 16 Pro - 2024-11-23 at 10 51 28](https://github.com/user-attachments/assets/93e1c618-258d-42b9-847a-71b6ff3ffc91)


### Movie Details Screen  
![Simulator Screenshot - iPhone 16 Pro - 2024-11-23 at 10 51 32](https://github.com/user-attachments/assets/7f678d77-cdee-41c9-8125-d20a9b307a7b)


## Tech Stack 🛠️  
- **Language**: Swift  
- **Framework**: UIKit  
- **Architecture**: MVC (Model-View-Controller)
- **Networking**: URLSession for API calls
- **UI Components**: `UITableView`, `UIImageView`, `UILabel`, `UIViewController`  

## How to Run 🏃‍♂️  
1. Clone this repository:  
   ```bash  
   git clone https://github.com/your-username/movie-viewer-app.git  
   ```  
2. Open the project in Xcode.  
3. Build and run the app on a simulator or a physical device.  

## Project Structure 🗂️  
- `Main.storyboard`: Contains the layout for the movie list and detail screens.  
- `MovieTableViewCell.swift`: Custom cell for displaying a movie's poster and title in the list.  
- `MovieDetailViewController.swift`: Handles the display of movie details.  
- `MovieModel.swift`: Defines the data structure for a movie.  

