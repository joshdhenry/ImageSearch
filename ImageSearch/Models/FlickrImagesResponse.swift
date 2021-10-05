//
//  FlickrImages.swift
//  ImageSearch
//
//  Created by Josh Henry on 10/5/21.
//

import Foundation

struct FlickrImagesResponse: Codable {
    let photos : FlickrImagesPage?
    let stat: String
}
