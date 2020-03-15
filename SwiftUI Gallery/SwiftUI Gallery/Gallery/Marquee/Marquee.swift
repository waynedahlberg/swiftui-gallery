//
//  Marquee.swift
//  SwiftUI Gallery
//
//  Created by Wayne Dahlberg on 3/14/20.
//  Copyright © 2020 Floppy Hat, LLC. All rights reserved.
//

import SwiftUI
import Foundation

struct Marquee: View {
    @State var text = "Wayne Dahlberg"
    @State private var animate = false
    
    private let animationOne = Animation.linear(duration: 2.5)
        .delay(3.5)
        .repeatForever(autoreverses: false)
    
    var body: some View {
        let stringWidth = text.widthOfString(usingFont: UIFont.systemFont(ofSize: 15))
        
        return ZStack {
            GeometryReader { geo in
                Text(self.text).lineLimit(1)
                    .font(.subheadline)
                    .offset(x: self.animate ? -stringWidth * 2 : 0)
                    .animation(self.animationOne)
                    .onAppear() {
                        if geo.size.width < stringWidth {
                            self.animate = true
                        }
                }
                .fixedSize(horizontal: true, vertical: false)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                
                Text(self.text).lineLimit(1)
                    .font(.subheadline)
                    .offset(x: self.animate ? 0 : stringWidth * 2)
                    .animation(self.animationOne)
                .fixedSize(horizontal: true, vertical: false)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            }
        }
    }
}



// MARK: - Preview
struct Marquee_Previews: PreviewProvider {
    static var previews: some View {
        Marquee()
    }
}

// MARK: - String Extension
extension String {
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
    
    func heightOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.height
    }
    
    func sizeOfString(usingFont font: UIFont) -> CGSize {
        let fontAttributes = [NSAttributedString.Key.font: font]
        return self.size(withAttributes: fontAttributes)
    }
}

