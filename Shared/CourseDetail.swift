//
//  CourseDetail.swift
//  DesignCodeCourse
//
//  Created by kaushal on 17/04/21.
//

import SwiftUI

struct CourseDetail: View {
    var nameSpace:Namespace.ID
    var course:Course = courses[0];
    #if os(iOS)
    var cornerRadius:CGFloat = 22
    #else
    var cornerRadius:CGFloat = 0
    #endif
    @ViewBuilder
    var body: some View {
        #if os(iOS)
        content
        .edgesIgnoringSafeArea(.all)
        #else
        content
        #endif
    }
    
    var content:some View{
        VStack {
            ScrollView {
                CourseItem(course: course,cornerRadius: 0)
                    .matchedGeometryEffect(id: course.id, in: nameSpace)
                    .frame(height:300)
                  
                VStack {
                    ForEach(courseSections) { item in
                        CourseRow(item: item)
                        Divider()
                    }
                }.padding()
            }
        }.background(Color("Background 1"))
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
        .matchedGeometryEffect(id: "Container\(course.id)", in: nameSpace)
        
    }
}

struct CourseDetail_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        CourseDetail(nameSpace: namespace)
    }
}
