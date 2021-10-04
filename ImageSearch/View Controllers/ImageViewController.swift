//
//  ImageViewController.swift
//  ImageSearch
//
//  Created by Josh Henry on 10/3/21.
//

import UIKit

class ImageViewController: UIViewController {
    @IBOutlet weak var ImageImageView: UIImageView!
    @IBOutlet weak var imageLabel: UILabel!
    
    var newImage: UIImage!
    var newText: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Now setting image vc to new props")
        print(newText!)
        print(newImage)
        
        ImageImageView.image = newImage
        imageLabel.text = newText
    }

}
