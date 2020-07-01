//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Subhash Yadav on 25/06/20.
//  Copyright © 2020 Subhash Yadav. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable{
    func firstIndex(matching:Element)-> Int?{
        for index in 0..<self.count{
            if self[index].id==matching.id{
                return index;
            }
        }
        return nil
    }
}
