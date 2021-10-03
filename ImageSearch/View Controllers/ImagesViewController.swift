//
//  ViewController.swift
//  ImageSearch
//
//  Created by Josh Henry on 10/2/21.
//

import UIKit

class ImagesViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet var imagesTableView: UITableView!
    @IBOutlet weak var imageSearchBar: UISearchBar!
    
    var imageData = [FlickrURLs]()
    var query: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        imagesTableView.delegate = self
        imagesTableView.dataSource = self
        imageSearchBar.delegate = self
        
//        FlickrAPIService.fetchImages(page: 1, completion: {(fetchSuccessful, fetchedImages) in
//            self.imageData = fetchedImages
//            //Update the table view on the main thread
//            DispatchQueue.main.async {
//                self.imagesTableView.reloadData()
//            }
//        })
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("Did end editing")
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("Search button clicked. Search for " + query)
        
        FlickrAPIService.fetchImages(page: 1, query: query, completion: {(fetchSuccessful, fetchedImages) in
            self.imageData = fetchedImages
            //Update the table view on the main thread
            DispatchQueue.main.async {
                self.imagesTableView.reloadData()
            }
        })
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        query = searchText
    }
}
