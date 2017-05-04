//
//  DetailsViewController.swift
//  thomashamburger-pset3
//
//  Created by Thomas Hamburger on 30-04-17.
//  Copyright © 2017 Thomas Hamburger. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var actorsLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var moviePoster: UIImageView!
    
    var movie: Dictionary<String, String>?

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = self.movie?["Title"]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButton(_ sender: Any) {
        var existing = UserDefaults.standard.array(forKey: "movies") as? [[String : String]] ?? []
        existing.append(self.movie!)
        UserDefaults.standard.set(existing, forKey: "movies")
    }
    
    // Geef object door aan Detail View
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "addToWatchList" {
//            let nextVC = segue.destination as! ViewController
//            nextVC.titles.append(movie.title)
//        }
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
