//
//  ViewController.swift
//  ImageSearch
//
//  Created by Josh Henry on 10/2/21.
//

import UIKit

class ImagesViewController: UIViewController {
    
    @IBOutlet weak var imageSearchBar: UISearchBar!
    @IBOutlet var imagesTableView: UITableView!
    
    var didReload: Bool = false
    var imageData = [FlickrImage]()
    var page: Int = 1
    var query: String = ""
    var rowCompletions = [Int: Bool]()
    var selectedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagesTableView.delegate = self
        imagesTableView.dataSource = self
        imageSearchBar.delegate = self
    }
}
