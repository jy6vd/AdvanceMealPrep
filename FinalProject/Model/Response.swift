//
//  Response.swift
//  FinalProject
//
//  Created by Jonathan Yee on 4/23/18.
//  Copyright © 2018 Jonathan Yee. All rights reserved.
//

import Foundation

struct Response<Element: Codable>: Codable {
    enum Status: String, Codable {
        case ok
        case error
    }
    
    var status: Response.Status
    var data: [Element]
    
    static func retrieve(fromResource resource: String) -> [Element] {
        guard let data = Data(forResource: resource, withExtension: "json") else { return [] }
        
        do {
            let response = try JSONDecoder().decode(Response<Element>.self, from: data)
            
            if response.status == Response.Status.ok {
                return response.data
            } else {
                return []
            }
        } catch {
            return []
        }
    }
}
