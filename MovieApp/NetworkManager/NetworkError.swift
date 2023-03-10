//
//  NetworkError.swift
//  MovieApp
//
//  Created by mahmoud yousef on 08/01/2023.
//

import Foundation


enum ErrorMessage : String , Error {
    
    case invalidURL         = "This URL created an invalid request. Please try again."
    case unableToComplete   = "Unable to complete your request. Please check your internet connection"
    case invalidResponse    = "Invalid response from the server. Please try again."
    case invalidData        = "The data received from the server was invalid. Please try again."
 
}
    
