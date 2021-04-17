//
//  CourseRow.swift
//  DesignCodeCourse
//
//  Created by kaushal on 03/04/21.
//

import SwiftUI

struct CourseRow: View {
    var item:CourseSection = courseSections[0]
    var body: some View {
        HStack(alignment: .top) {
            Image(item.logo).renderingMode(.original).frame(width: 48.0, height: 48.0)
                .imageScale(.medium)
                .background(item.color)
                .clipShape(Circle())
                .foregroundColor(.white)
            VStack(alignment: .leading, spacing: 4.0){
                Text(item.title)
                    .font(.subheadline)
                    .fontWeight(.bold)
                Text(item.subtitle)
                    .font(.footnote).foregroundColor(.secondary)
            }
            Spacer()
        }
    }
}

struct CourseRow_Previews: PreviewProvider {
    static var previews: some View {
        CourseRow()
    }
}
