//
//  Array+Only.swift
//  Memorize
//
//  Created by Subhash Yadav on 29/06/20.
//  Copyright © 2020 Subhash Yadav. All rights reserved.
//

import Foundation

extension Array {
    var only: Element?{
        count == 1 ? first : nil
    }
}
