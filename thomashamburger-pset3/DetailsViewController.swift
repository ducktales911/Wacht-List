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
    
    var movie = Movie.init()

    override func viewDidLoad() {
        super.viewDidLoad()
        print(movie.year + "YEAR IN SECONDVC!!!")
        titleLabel.text = movie.title
        ratingLabel.text = movie.rating
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButton(_ sender: Any) {
        // geef object door
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
