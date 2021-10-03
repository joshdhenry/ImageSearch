//
//  ViewController.swift
//  ImageSearch
//
//  Created by Josh Henry on 10/2/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet var imagesTableView: UITableView!
    @IBOutlet var field: UITextField!
    
    var imageData = [FlickrURLs]()

    override func viewDidLoad() {
        super.viewDidLoad()

        imagesTableView.delegate = self
        imagesTableView.dataSource = self
        field.delegate = self
        
        FlickrAPIService.fetchImages(page: 1, completion: {(fetchSuccessful, fetchedImages) in
            print("In completion handler")
            print(fetchedImages)
            self.imageData = fetchedImages
            //Update the table view on the main thread
            DispatchQueue.main.async {
                self.imagesTableView.reloadData()
            }
        })
        }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        if let text = textField.text {
//            filterText(text + string)
//        }
//
        return true
    }
    
//    func filterText(_ query: String) {
//        filteredData.removeAll()
//        for string in data {
//            if string.lowercased().starts(with: query.lowercased()) {
//                filteredData.append(string)
//            }
//        }
//
//        imagesTableView.reloadData()
//    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as! ImageTableViewCell
        let hasData = imageData.count > 0
        
        if hasData {
            print(imageData[0])
            print(imageData[0].id)
//            cell.textLabel?.text = data2[indexPath.row].id
            
            let flickrUrl = FlickrAPIService.getImageUrl(server: imageData[indexPath.row].server, id: imageData[indexPath.row].id, secret: imageData[indexPath.row].secret)
            print(flickrUrl)
            
            if let url = URL(string: flickrUrl) {
                let task = URLSession.shared.dataTask(with: url) { data, response, error in
                    guard let data = data, error == nil else { return }
                    
                    DispatchQueue.main.async { /// execute on main thread
//                        cell.textLabel?.text = self.data2[indexPath.row].id
                        cell.imageLabel.text = self.imageData[indexPath.row].id  
                        print(data)
                        cell.imageImageView.image = UIImage(data: data)
                    }
                }
                
                task.resume()
            }
                        
//            cell.imageLabel = data2[indexPath.row].id
            

        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

