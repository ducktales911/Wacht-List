//
//  ViewController.swift
//  thomashamburger-pset3
//
//  Created by Thomas Hamburger on 30-04-17.
//  Copyright © 2017 Thomas Hamburger. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITabBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    let titles = ["Psycho", "Zoolander", "Terminator", "Alien"]
    
    let descritions = [
        "Psycho": "Horror",
        "Zoolander": "Comedy",
        "Terminator": "Action",
        "Alien": "Science Fiction"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieResultCell
        cell.movieName.text = titles[indexPath.row]
        
        if let description = descritions[titles[indexPath.row]] {
            cell.movieDescription.text = description
        } else {
            cell.movieDescription.text = ""
        }
        
        if let image = UIImage(named: titles[indexPath.row]) {
            cell.movieImage.image = image
        }
        
        return cell
    }


}

