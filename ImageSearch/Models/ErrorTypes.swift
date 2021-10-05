//
//  ErrorTypes.swift
//  ImageSearch
//
//  Created by Josh Henry on 10/4/21.
//

import Foundation

//Possible error types that may be encountered.
enum ErrorTypes: Error {
    case apiKeyError
    case apiKeyPListError
    case queryMissingError
}
