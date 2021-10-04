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

        // Do any additional setup after loading the view.
        
        print("Now setting image vc to new props")
        print(newText)
        
        ImageImageView.image = newImage
        imageLabel.text = newText
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
