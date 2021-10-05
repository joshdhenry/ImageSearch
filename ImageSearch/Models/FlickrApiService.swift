//
//  flickrApiService.swift
//  ImageSearch
//
//  Created by Josh Henry on 10/2/21.
//

import Foundation

class FlickrAPIService {
    class func fetchImages(page: Int, query: String, completion: @escaping (_ fetchSuccessful: Bool, _ fetchedImages: [FlickrImage])->()) throws {
        guard query != "" else {
            throw ErrorTypes.queryMissingError
        }
                
        var keys: NSDictionary = NSDictionary()
    
        //Try to set the keys dictionary
        do {
            keys = try getAPIKeys()
        }
        catch {
            throw ErrorTypes.apiKeyPListError
        }
        
        //Attempt to load the AlaskaAirlinesBasicAuthorizationString from the keys dictionary
        guard let apiKey: String = keys["FlickrApiKey"] as? String else {
            throw ErrorTypes.apiKeyError
        }
                
        let flickrURL = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=6343a66eb46c461c91934e8a7a981056&text=" + query + "&format=json&nojsoncallback=1&page=" + String(page)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: NSURL(string :flickrURL)! as URL) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            } else if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let flickrPhotos = try decoder.decode(FlickrImagesResponse.self, from: data)

                    completion(true, flickrPhotos.photos!.photo)
                } catch {
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
        dataTask.resume()
    }
    
    class func getImageUrl(server: String, id: String, secret: String) -> String {
        let url = "https://live.staticflickr.com/" + server + "/" + id + "_" + secret + "_m.jpg"
        
        return url
    }
    
    //Load the API keys from ApiKeys.plist
    class func getAPIKeys() throws -> NSDictionary {
        if let path = Bundle.main.path(forResource: "ApiKeys", ofType: "plist") {
            return NSDictionary(contentsOfFile: path)!
        }
        else {
            throw ErrorTypes.apiKeyPListError
        }
    }
}
