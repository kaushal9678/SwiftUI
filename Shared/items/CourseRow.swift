//
//  CourseRow.swift
//  DesignCodeCourse
//
//  Created by kaushal on 03/04/21.
//

import SwiftUI

struct CourseRow: View {
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "paperplane.circle.fill").renderingMode(.template).frame(width: 48.0, height: 48.0)
                .imageScale(.medium)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                .clipShape(Circle())
                .foregroundColor(.white)
            VStack(alignment: .leading, spacing: 4.0){
                Text("SwiftUI")
                    .font(.subheadline)
                    .fontWeight(.bold)
                Text("Description")
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
