//
//  MovieDetailsViewController.swift
//  FlixCodepath
//
//  Created by Rogelio Lopez on 2/9/22.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var backdropImage: UIImageView!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var tittleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var movie = [String:Any]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // setting poster image
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
        posterImage.af.setImage(withURL: posterUrl!)
        
        // setting backdrop image
        let backdropbaseUrl = "https://image.tmdb.org/t/p/w780"
        let backdropPath = movie["backdrop_path"] as! String
        let backdropUrl = URL(string: backdropbaseUrl + backdropPath)
        backdropImage.af.setImage(withURL: backdropUrl!)
        
        
        tittleLabel.text = movie["title"] as! String
        tittleLabel.sizeToFit()
        descriptionLabel.text = movie["overview"] as! String
        descriptionLabel.sizeToFit()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
