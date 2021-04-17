//
//  CoursesView.swift
//  DesignCodeCourse
//
//  Created by kaushal on 03/04/21.
//

import SwiftUI

struct CoursesView: View {
    @State var show = false
    
    @Namespace var nameSpace;
    @State var selectedItem: Course? = nil;
    @State var isDisabled = false;
    var body: some View{
        ZStack {
            #if os(iOS)
            content
                .navigationBarHidden(true)
            fullContent
                .background(VisualEffectBlur(blurStyle: .systemMaterial).edgesIgnoringSafeArea(.all))
            #else
            content
            fullContent
            .background(VisualEffectBlur().edgesIgnoringSafeArea(.all))
            #endif
        }
        .navigationTitle("Courses")
            
        }
   
    var content: some View{
       
        
        ScrollView {
            VStack(spacing:0) {
                Text("Courses")
                    .font(.largeTitle)
                    .bold()
                    .frame(maxWidth:.infinity, alignment: .leading)
                    .padding(.leading,16)
                    .padding(.top,54)
                LazyVGrid(
                    columns:[
                        GridItem(.adaptive(minimum: 160),spacing: 16)]
                    ,spacing:16
                ) {
                    ForEach(courses) { item in
                        VStack {
                            CourseItem(course: item)
                                .matchedGeometryEffect(id: item.id, in: nameSpace,isSource: !show)
                                .frame( height: 200, alignment: .center)
                                .onTapGesture {
                                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0)){
                                        show.toggle()
                                        selectedItem = item
                                        isDisabled = true;
                                    }
                                    
                                }
                                .disabled(isDisabled)
                        }.matchedGeometryEffect(id: "Container\(item.id)", in: nameSpace,isSource: !show)
                    }
                    
                }
                .padding(16)
                .frame(maxWidth:.infinity)
                Text("Latest Sections")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity,  alignment: .leading)
                    .padding()
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 240))], content: {
                    ForEach(courseSections){ item in
                        CourseRow(item: item)
                    }
                })
            }
            
        }.zIndex(1)
    }
    @ViewBuilder
    var fullContent : some View{
        
        if selectedItem != nil  {
            ZStack(alignment:.topTrailing) {
                CourseDetail(nameSpace: nameSpace, course: selectedItem!)
                CloseButton().padding( 16)
                    .onTapGesture {
                    withAnimation(.spring()){
                        show.toggle()
                        selectedItem = nil
                        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                            isDisabled = false;
                        }
                        
                    }
                    
                }
            }.zIndex(2)
            .frame(maxWidth:712)
            .frame(maxWidth:.infinity)
           
        }
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
