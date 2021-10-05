//
//  ImageViewController.swift
//  ImageSearch
//
//  Created by Josh Henry on 10/3/21.
//

import UIKit

class ImageViewController: UIViewController {
    @IBOutlet weak var imageImageView: UIImageView!
    
    var newImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageImageView.enableZoom()
        
        imageImageView.image = newImage
    }

}
