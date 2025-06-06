//
//  ModelData.swift
//  Landmarks
//
//  Created by Ranjana Raghavan on 6/2/25.
//

import Foundation
//import Observation


@Observable
class ModelData {
    var landmarks : [Landmark] = load("landmarkData.json")
}

func load<T : Decodable>(_ filename: String) -> T {
    
    let data:Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else{
        fatalError("Coudn't find \(filename) in main bundle")
    }
    
    do{
        data = try Data(contentsOf: file)
    }catch{
        fatalError("Couldn't load \(filename) from main bundle. \(error)")
    }
    
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from:data)
    } catch{
        fatalError("Couldn't parse \(filename) as \(T.self). \(error)")
    }
}
