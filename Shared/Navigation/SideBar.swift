//
//  SideBar.swift
//  DesignCodeCourse
//
//  Created by kaushal on 03/04/21.
//

import SwiftUI

struct SideBar: View {
    var body: some View {
       
        NavigationView {
            #if os(iOS)
            content.navigationTitle("Learn").toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action:{}) {
                        Image(systemName: "person.crop.circle")
                    }
                }
            })
            #else
            content.frame(minWidth:200,idealWidth: 250, maxWidth: 300).toolbar(content: {
                ToolbarItem(placement: .automatic) {
                    Button(action:{}) {
                        Image(systemName: "person.crop.circle")
                    }
                }
            })
            #endif
            CoursesView()
        }
    }
    var content:some View{
        List {
            NavigationLink(
                destination: CoursesView()
                ) {
                Label("Courses", systemImage: "book.closed")
            }
            Label("Tutorials", systemImage: "list.bullet.rectangle")
            Label("LiveStreams", systemImage: "tv")
            Label("Certificates", systemImage: "mail.stack")
            Label("Search", systemImage: "magnifyingglass")
        }.listStyle(SidebarListStyle())
    }
}

struct SideBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SideBar()
           
        }
    }
}
