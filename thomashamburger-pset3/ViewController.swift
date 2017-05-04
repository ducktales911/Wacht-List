//
//  ViewController.swift
//  thomashamburger-pset3
//
//  Created by Thomas Hamburger on 30-04-17.
//  Copyright © 2017 Thomas Hamburger. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var watchList = UserDefaults.standard.array(forKey: "movies") as? [[String : String]] ?? []
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return watchList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieResultCell
        cell.movieName.text = self.watchList[indexPath.row]["Title"] as? String
        if let year = self.watchList[indexPath.row]["Year"] {
            cell.movieDescription.text = year as? String
        } else {
            cell.movieDescription.text = ""
        }

//        if let image = UIImage(named: titles[indexPath.row]) {
//            cell.movieImage.image = image
//        }
        
        return cell
    }


}

