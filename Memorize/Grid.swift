//
//  Grid.swift
//  Memorize
//
//  Created by Subhash Yadav on 15/06/20.
//  Copyright © 2020 Subhash Yadav. All rights reserved.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    var items: [Item]
    var viewForItem: (Item) -> ItemView
  
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView){
        self.items=items
        self.viewForItem = viewForItem
        
    }
    
    var body: some View {
        GeometryReader { geomtery in
            self.body(for: GridLayout(itemCount: self.items.count, in: geomtery.size))
        }
    }
        func body(for layout: GridLayout) -> some View{
            ForEach(items){ item in
                self.body(for: item, in: layout)
                               
                           }
        }
    func body(for item:Item, in layout: GridLayout) -> some View{
        let id = items.firstIndex(matching: item)!
        return Group {
            if id != nil{
                              viewForItem(item)
                             .frame(width: layout.itemSize.width, height: layout.itemSize.height)
                             .position(layout.location(ofItemAt: id))
                  }
        }
    }
       

}




