//
//  NetworkConstant.swift
//  MovieApp
//
//  Created by mahmoud yousef on 08/01/2023.
//

import Foundation


class NetworkConstant{
    
    static let shared = NetworkConstant()
    
    private init(){}
    
    var apiKey: String {
        return "1c2bd6e906b4c59b3bcce6837addecd3"
    }
    
    var baseURL : String {
        return "https://api.themoviedb.org/3/"
    }
    
}



