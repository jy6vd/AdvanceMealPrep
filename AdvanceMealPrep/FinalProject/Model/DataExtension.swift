//
//  Data.swift
//  FinalProject
//
//  Created by Jonathan Yee on 4/24/18.
//  Copyright © 2018 Jonathan Yee. All rights reserved.
//

import Foundation

extension Data {
    init?(forResource resource: String, withExtension ext: String) {
        guard let fileURL = Bundle.main.url(forResource: resource, withExtension: ext) else { return nil }
        
        do {
            try self.init(contentsOf: fileURL)
        } catch {
            return nil
        }
    }
}
