//
//  SearchViewController.swift
//  thomashamburger-pset3
//
//  Created by Thomas Hamburger on 01-05-17.
//  Copyright © 2017 Thomas Hamburger. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    var searchResults: [Dictionary<String, AnyObject>] = []
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieResultCell
        return cell
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let keyWords = searchBar.text
        let finalKeywords = keyWords?.replacingOccurrences(of: " ", with: "+")
        getData(searchTerms: finalKeywords!)
        self.view.endEditing(true)
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
                    
                    // Check if the response is true.
                    if json["Error"] != nil {
                        self.searchResults = []
                    }
                    else {
                        // The list with results.
                        self.searchResults = json["Search"]! as! [Dictionary<String, AnyObject>]
                    }
                } catch {
                    self.searchResults = []
                }
                // reload table vieuw data
                // self.tableView.reloadData()
                print(self.searchResults)
            }
        }).resume()
    }
    
    // Parse Data
    
}
