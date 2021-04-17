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
            ScrollView {
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
                                    withAnimation(.spring()){
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
            }
            
            if selectedItem != nil  {
                VStack {
                    ScrollView {
                        CourseItem(course: selectedItem!)
                            .matchedGeometryEffect(id: selectedItem!.id, in: nameSpace)
                            .frame(height:300)
                            .onTapGesture {
                                withAnimation(.spring()){
                                    show.toggle()
                                    selectedItem = nil
                                    DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                                        isDisabled = false;
                                    }
                                    
                                }
                                
                            }
                        VStack {
                            ForEach(0 ..< 25) { item in
                                CourseRow()
                            }
                        }.padding()
                    }
                }.background(Color("Background 1"))
                .matchedGeometryEffect(id: "Container\(selectedItem!.id)", in: nameSpace)
                .transition(
                    .asymmetric(insertion:
                                    AnyTransition
                                    .opacity
                                    .animation(Animation.spring()
                                                .delay(0.03)),
                                    removal: AnyTransition
                                    .opacity
                                    .animation(Animation
                                            .spring()
                                    )
                    )
                )
                .edgesIgnoringSafeArea(.all)
            }
            
        }//.animation(.easeInOut)//It is much slower so prefer withAnimation modifier
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
