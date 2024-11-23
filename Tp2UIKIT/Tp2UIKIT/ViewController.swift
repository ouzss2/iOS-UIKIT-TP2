//
//  ViewController.swift
//  Tp2UIKIT
//
//  Created by Tekup-mac-1 on 22/11/2024.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    
    var movies: [Movie] = []
    
    @IBOutlet weak var mytable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mytable.dataSource = self
        mytable.delegate = self
        fetchMovies()
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        let vc = storyboard?.instantiateViewController(identifier: "details") as! DetailsViewController
        vc.descriptiontext = movie.description
        vc.imageurl = movie.image
        vc.titletext = movie.title
        navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
           
           let movie = movies[indexPath.row]
            cell.mylabel?.text = movie.title
          // cell.detailTextLabel?.text = movie.description
           
           // Load the image asynchronously
           if let imageUrl = URL(string: movie.image) {
               DispatchQueue.global().async {
                   if let data = try? Data(contentsOf: imageUrl) {
                       DispatchQueue.main.async {
                           cell.myimage?.image = UIImage(data: data)
                           cell.setNeedsLayout()
                       }
                   }
               }
           }
           
           return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        300
    }
    
    func fetchMovies() {
            let headers = [
                "x-rapidapi-key": "18024fb7bcmshd76a937c328c985p1147d9jsn8273faa1f53e",
                "x-rapidapi-host": "imdb-top-100-movies.p.rapidapi.com"
            ]
            
            let url = URL(string: "https://imdb-top-100-movies.p.rapidapi.com/")!
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = headers
            
            let session = URLSession.shared
            let dataTask = session.dataTask(with: request) { [weak self] data, response, error in
                if let error = error {
                    print("Error fetching data: \(error)")
                    return
                }
                
                guard let data = data else {
                    print("No data received.")
                    return
                }
                
                do {
                    let movies = try JSONDecoder().decode([Movie].self, from: data)
                    DispatchQueue.main.async {
                        self?.movies = movies
                        self?.mytable.reloadData()
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
            
            dataTask.resume()
        }
    }


