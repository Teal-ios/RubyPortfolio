//
//  CircularList.swift
//  RubyPortfolio
//
//  Created by 이병현 on 2023/10/07.
//

import SwiftUI

struct P183_CircularList: View {
    
    let rowSize: CGSize = CGSize(width: 120, height: 80)
    
    @State private var offsetValue: ScrollOffsetValue = ScrollOffsetValue()
    
    init() {}
    var body: some View {
        ZStack {
            GeometryReader { proxyP in
                ScrollView {
                    ZStack {
                        LazyVStack {
                            Rectangle()
                                .fill(Color.clear)
                                .frame(height: proxyP.size.height * 0.5)
                            ForEach(0...5, id:\.self) { index in
                                GeometryReader { proxyC in
                                    let rect = proxyC.frame(in: .named("scroll"))
                                    let y = rect.minY
                                    let curveX = getCurveValue(y, proxyP.size.height) * rowSize.height - rowSize.height
                                    let opacity = getAlphaValue(y, proxyP.size.height)
                                    
#if os(iOS)
                                    NavigationLink {
                                        DetailView(index: index)
                                            .edgesIgnoringSafeArea(.all)
                                    } label: {
                                        getRowView(index)
                                            .opacity(opacity)
                                            .offset(x: curveX)
                                            .rotationEffect(.degrees(getRotateValue(y, proxyP.size.height) * 20), anchor: .leading)
                                    }
#else
                                    Button {
                                        
                                    } label: {
                                        getRowView(index)
                                            .opacity(opacity)
                                            .offset(x: curveX)
                                            .rotationEffect(.degrees(getRotateValue(y, proxyP.size.height) * 20), anchor: .leading)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                    
#endif
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                            .frame(width: rowSize.width, height: rowSize.height)
                            Rectangle()
                                .fill(Color.clear)
                                .frame(height: max(proxyP.size.height * 0.5, 1))
                        }
                        .offset(x: -proxyP.size.width * 0.2)
                        
                        OffsetInScrollView(named: "scroll")
                    }
                }
            }
            .modifier(OffsetOutScrollModifier(offsetValue: $offsetValue, named: "scroll"))
            .padding()
        }
    }
    
    private func getRowView(_ index: Int) -> some View {
        
        Text(getIndexToString(index))
            .padding(8)
            .foregroundColor(Color.rubyWhite)
            .frame(width: rowSize.width, height: rowSize.height)
            .background(Color.black)
            .clipShape(Capsule())
        
    }
    
    private func getAlphaValue(_ current: Double, _ total: Double) -> CGFloat {
        let x = Double(current) / Double(total)
        let y = (sin(-1.1 * (.pi * x) - .pi / 1))
        return CGFloat(y)
    }
    
    private func getCurveValue(_ current: Double, _ total: Double) -> CGFloat {
        let x = Double(current) / Double(total)
        let y = (sin(-1 * .pi * x - .pi) + 0.5) / 2.0
        return 2 * CGFloat(y)
    }
    
    private func getRotateValue(_ current: Double, _ total: Double) -> CGFloat {
        let x = Double(current) / Double(total)
        let y = (sin(.pi * x - (.pi / 2.0))) / 2.0
        return 2 * CGFloat(y)
    }
    
    private func getIndexToString(_ index: Int) -> String {
        switch index {
        case 0:
            return "작가 소개"
        case 1:
            return "작가 이력"
        case 2:
            return "일기장"
        case 3:
            return "이솝 이야기"
        case 4:
            return "신세계 이야기"
        case 5:
            return "메이킹 필름"
        default:
            return "미정"
        }
    }
}

fileprivate
struct ScrollOffsetValue: Equatable {
    var x: CGFloat = 0
    var y: CGFloat = 0
    var contentSize: CGSize = .zero
    
}

fileprivate
struct ScrollOffsetKey: PreferenceKey {
    typealias Value = ScrollOffsetValue
    static var defaultValue = ScrollOffsetValue()
    static func reduce(value: inout Value, nextValue: () -> Value) {
        let newValue = nextValue()
        value.x += newValue.x
        value.y += newValue.y
        value.contentSize = newValue.contentSize
    }
}

fileprivate
struct OffsetInScrollView: View {
    let named: String
    var body: some View {
        GeometryReader { proxy in
            let offsetValue = ScrollOffsetValue(x: proxy.frame(in: .named(named)).minX,
                                                y: proxy.frame(in: .named(named)).minY,
                                                contentSize: proxy.size)
            Color.clear.preference(key: ScrollOffsetKey.self, value: offsetValue)
        }
    }
}

fileprivate
struct OffsetOutScrollModifier: ViewModifier {
    
    @Binding var offsetValue: ScrollOffsetValue
    let named: String
    
    func body(content: Content) -> some View {
        GeometryReader { proxy in
            content
                .coordinateSpace(name: named)
                .onPreferenceChange(ScrollOffsetKey.self) { value in
                    offsetValue = value
                    offsetValue.contentSize = CGSize(width: offsetValue.contentSize.width - proxy.size.width, height: offsetValue.contentSize.height - proxy.size.height)
                }
        }
    }
}

fileprivate
struct DetailView: View {
    
    let index: Int
    
    var body: some View {
        viewCase(index)
    }
}

extension DetailView {
    private func viewCase(_ index: Int) -> some View {
        DetailArtistInfoView(viewCase: index)
    }
}
struct P183_CircularList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            P183_CircularList()
        }
    }
}
