//
//  MovieGridViewController.swift
//  FlixCodepath
//
//  Created by Rogelio Lopez on 2/9/22.
//

import UIKit
import AlamofireImage
class MovieGridViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource{

    @IBOutlet weak var collectionView: UICollectionView!
    
    var movies = [[String:Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        
        let width = (view.frame.size.width - layout.minimumInteritemSpacing * 2) / 3
        layout.itemSize = CGSize(width: width, height: width * 3 /  2)
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/297762/similar?api_key=e7d04eb4d561880815be40eacf144f2d")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]

                    // TODO: Get the array of movies
                 self.movies = dataDictionary["results"] as! [[String:Any]]
                 self.collectionView.reloadData()
                 print(self.movies)
             }
        }
        task.resume()
       
         
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCollectionViewCell", for: indexPath) as! GridCollectionViewCell
        
        let movie = movies[indexPath.item]
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
        
        cell.gridImage.af.setImage(withURL: posterUrl!)
        return cell
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
