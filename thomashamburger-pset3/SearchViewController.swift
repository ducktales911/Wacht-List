//
//  SearchViewController.swift
//  thomashamburger-pset3
//
//  Created by Thomas Hamburger on 01-05-17.
//  Copyright © 2017 Thomas Hamburger. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var movie = Movie.init()
    
    var searchResults: [Dictionary<String, AnyObject>] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieResultCell
        cell.movieName.text = self.searchResults[indexPath.row]["Title"] as? String
        if let year = self.searchResults[indexPath.row]["Year"] {
            cell.movieDescription.text = year as? String
        } else {
            cell.movieDescription.text = ""
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        movie.title = self.searchResults[indexPath.row]["Title"] as! String
        movie.rating = self.searchResults[indexPath.row]["imdbID"] as! String
        movie.description = self.searchResults[indexPath.row]["Title"] as! String
        movie.year = self.searchResults[indexPath.row]["Year"] as! String
        movie.image = self.searchResults[indexPath.row]["Poster"] as! String
        print(movie.title + "CLICKED!!")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "searchSegue" {
            let nextVC = segue.destination as! DetailsViewController
            nextVC.movie = movie
            
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange keyWords: String) {
        let finalKeywords = keyWords.replacingOccurrences(of: " ", with: "+")
        getData(searchTerms: finalKeywords)
    }
    
    func getData(searchTerms: String) {
        let urlString = "https://www.omdbapi.com/?s=" + searchTerms
        let request = URLRequest(url: URL(string: urlString)!)
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            
            // Guards execute when the condition is NOT met.
            guard let data = data, error == nil else {
                self.searchResults = []
                // Error handling
                return
            }
            // Get access to the main thread and the interface elements:
            DispatchQueue.main.async {
                do {
                    // Convert data to json.
                    let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:AnyObject]
                    if json["Error"] != nil {
                        self.searchResults = []
                    }
                    else {
                        self.searchResults = json["Search"]! as! [Dictionary<String, AnyObject>]
                    }
                } catch {
                    self.searchResults = []
                }
                // reload table vieuw data
                self.tableView.reloadData()
            }
        }).resume()
    }
}
