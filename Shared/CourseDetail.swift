//
//  CourseDetail.swift
//  DesignCodeCourse
//
//  Created by kaushal on 17/04/21.
//

import SwiftUI

struct CourseDetail: View {
    var course:Course = courses[0];
    
    var nameSpace:Namespace.ID
    var body: some View {
        VStack {
            ScrollView {
                CourseItem(course: course)
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
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
        .matchedGeometryEffect(id: "Container\(course.id)", in: nameSpace)
        
        .edgesIgnoringSafeArea(.all)
            
    }
}

struct CourseDetail_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        CourseDetail(nameSpace: namespace)
    }
}
