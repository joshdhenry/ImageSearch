//
//  ViewController.swift
//  ImageSearch
//
//  Created by Josh Henry on 10/2/21.
//

import UIKit

class ImagesViewController: UIViewController {
    
    @IBOutlet var imagesTableView: UITableView!
    @IBOutlet weak var imageSearchBar: UISearchBar!
    
    var imageData = [FlickrURLs]()
    var query: String = ""
    var selectedImage: UIImage!
    var rowCompletions = [Int: Bool]()
    var didReload = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagesTableView.delegate = self
        imagesTableView.dataSource = self
        imageSearchBar.delegate = self
    }
}
