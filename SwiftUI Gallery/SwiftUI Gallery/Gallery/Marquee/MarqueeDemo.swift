//
//  MarqueeDemo.swift
//  SwiftUI Gallery
//
//  Created by Wayne Dahlberg on 3/14/20.
//  Copyright © 2020 Floppy Hat, LLC. All rights reserved.
//

import SwiftUI

struct MarqueeDemo: View {
    @State var text : String = """
    Tell me what you really like Baby I can take my time We don't ever have to fight Just take it step-by-step I can see it in your eyes 'Cause they never tell mes I can feel that body shake And the heat between your legs  You've been scared of love and what it did to you You don't have to run, I know what you've been through Just a simple touch and it can set you free We don't have to rush when you're alone with me I feel it coming, I feel it coming, babe I feel it coming, I feel it coming, babe I feel it coming, I feel it coming, babe I feel it coming, I feel it coming, babe
"""
    
    var body: some View {
        VStack(alignment: .leading) {
            Marquee(text: text)
        }
        .frame(width: 230, height: 30)
        .clipShape(RoundedRectangle(cornerRadius: 0, style: .continuous))
    }
}

struct MarqueeDemo_Previews: PreviewProvider {
    static var previews: some View {
        MarqueeDemo()
    }
}
