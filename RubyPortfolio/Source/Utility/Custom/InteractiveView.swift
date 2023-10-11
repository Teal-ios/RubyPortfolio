//
//  InteractiveView.swift
//  RubyPortfolio
//
//  Created by 이병현 on 2023/10/11.
//

import SwiftUI

struct InteractiveView : View {
    @State var degree = 0.0
    @State var xAxis : CGFloat = 0
    @State var yAxis : CGFloat = 0
    
    var body: some View {
        GeometryReader { geo in
            let gesture = DragGesture()
                .onChanged { value in
                    degree = 0
                    //bottom right
                    if value.location.x > geo.frame(in: .local).midX &&
                        value.location.y > geo.frame(in: .local).midY {
                        xAxis = -1
                        yAxis = 1
                        degree = 20
                    }
                    //bottom left
                    else  if value.location.x < geo.frame(in: .local).midX &&
                                value.location.y > geo.frame(in: .local).midY {
                        xAxis = -1
                        yAxis = -1
                        degree = 20
                    }
                    //top left
                    else  if value.location.x < geo.frame(in: .local).midX &&
                                value.location.y < geo.frame(in: .local).midY {
                        xAxis = 1
                        yAxis = -1
                        degree = 20
                    }
                    // top right???
                    else  if value.location.x > geo.frame(in: .local).midX &&
                                value.location.y < geo.frame(in: .local).midY {
                        xAxis = 1
                        yAxis = 1
                        degree = 20
                    }
                }.onEnded { value in
                    degree = 0
                    xAxis = 0
                    yAxis = 0
                }
            
            MyView(degree: $degree)
                .rotation3DEffect(Angle(degrees: degree), axis: (x: xAxis, y: yAxis, z: 0))
                .gesture(gesture)
                .animation(.spring(dampingFraction: 0.4), value: degree)
                .animation(.spring(dampingFraction: 0.4), value: xAxis)
                .animation(.spring(dampingFraction: 0.4), value: yAxis)
        }.frame(width: 300, height: 300)

    }
}

struct MyView : View {
    @Binding var degree : Double
    var body: some View {
        ZStack {

            Image("3-1. 0810-1, Tapestry, wool, 1300 x 110mm, 2022")
                .resizable()
                .cornerRadius(10)
            
            Image("3-1. 0810-1, Tapestry, wool, 1300 x 110mm, 2022")
                .resizable()
                .cornerRadius(10)

            Image("3-1. 0810-1, Tapestry, wool, 1300 x 110mm, 2022")
                .resizable()
                .cornerRadius(10)
            
        }.hueRotation(Angle(degrees: degree))
    }
}
