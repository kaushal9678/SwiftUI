//
//  CourseList.swift
//  DesignCodeCourse
//
//  Created by kaushal on 04/04/21.
//

import SwiftUI

struct CourseList: View {
    @ViewBuilder
    var body: some View {
        #if os(iOS)
        content.listStyle(InsetGroupedListStyle())
        #else
        content.frame(minWidth: 800, minHeight: 600,  alignment: .center)
        #endif
    }
    var content:some View{
        List(0 ..< 20) { item in
            CourseRow()
        }
        .navigationTitle("Courses")
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}
