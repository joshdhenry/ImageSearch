//
//  flickrApiService.swift
//  ImageSearch
//
//  Created by Josh Henry on 10/2/21.
//

import Foundation

class FlickrAPIService {
    class func fetchImages(page: Int, query: String, completion: @escaping (_ fetchSuccessful: Bool, _ fetchedImages: [FlickrURLs])->()) {
        print("Fetching images: ", query)
        //        let flickrURL = "http://api.flickr.com/services/feeds/photos_public.gne?tags=vegetables&tagmode=any&format=json&jsoncallback=?"

        //        let flickrURL = "https://api.flickr.com/services/rest/?method=flickr.galleries.getPhotos&api_key=6343a66eb46c461c91934e8a7a981056&gallery_id=66911286-72157647277042064&format=json&nojsoncallback=1"
                
        let flickrURL = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=6343a66eb46c461c91934e8a7a981056&text=" + query + "&format=json&nojsoncallback=1"
        let session = URLSession.shared

        let dataTask = session.dataTask(with: NSURL(string :flickrURL)! as URL) { (data, response, error) in
            if let error = error {
                print("json error: \(error.localizedDescription)")
                return
            } else if let data = data {
//                let result = String(data: data, encoding: .utf8)
                do {
                    let decoder = JSONDecoder()
                    let flickrPhotos = try decoder.decode(FlickrImageResult.self, from: data)
                    completion(true, flickrPhotos.photos!.photo)
                } catch {
                    dump(data)
                    print("json error: \(error)")
                }
            }
        }
        dataTask.resume()
    }
    
    class func getImageUrl(server: String, id: String, secret: String) -> String {
        let url = "https://live.staticflickr.com/" + server + "/" + id + "_" + secret + "_m.jpg"
        
        return url
    }
}
