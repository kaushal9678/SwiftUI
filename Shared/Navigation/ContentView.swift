//
//  ContentView.swift
//  Shared
//
//  Created by kaushal on 30/03/21.
//

import SwiftUI

struct ContentView: View {
    @ViewBuilder
    var body: some View {
       
        #if os(iOS)
           content
        #else
        content.frame(minWidth: 1000, idealWidth: 100, maxWidth: .infinity, minHeight: 600, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment:.center)
        #endif
        }
    var content:some View{
        SideBar()
    }
        
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
          
                
        }
    }
}
