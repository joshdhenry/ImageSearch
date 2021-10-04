//
//  ImageViewController.swift
//  ImageSearch
//
//  Created by Josh Henry on 10/3/21.
//

import UIKit

class ImageViewController: UIViewController {
    @IBOutlet weak var ImageImageView: UIImageView!
    
    var newImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Now setting image vc to new props")
        print(newImage)
        
        ImageImageView.image = newImage
    }

}
