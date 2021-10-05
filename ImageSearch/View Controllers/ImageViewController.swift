//
//  ImageViewController.swift
//  ImageSearch
//
//  Created by Josh Henry on 10/3/21.
//

import UIKit

class ImageViewController: UIViewController {
    // TODO: Rename this
    @IBOutlet weak var ImageImageView: UIImageView!
    
    var newImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ImageImageView.enableZoom()
        
        ImageImageView.image = newImage
    }

}
