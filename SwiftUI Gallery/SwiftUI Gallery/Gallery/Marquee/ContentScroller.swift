//
//  ContentScroller.swift
//  SwiftUI Gallery
//
//  Created by Wayne Dahlberg on 3/15/20.
//  Copyright © 2020 Floppy Hat, LLC. All rights reserved.
//

import SwiftUI

struct MarqueeModifier: ViewModifier {
    let duration: TimeInterval
    let spacing: CGFloat
    @State private var enabled: Bool = false
    func body(content: Content) -> some View {
        HStack(alignment: .firstTextBaseline) {
            if enabled {
                content
                    .padding(.leading, spacing)
                    .transition(.move(edge: .trailing))
            } else {
                content
                    .padding(.leading, spacing)
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
            }
        }
        .clipped()
        .animation(Animation.linear(duration: duration).repeatForever(autoreverses: false))
        .onAppear {
            self.enabled = true
        }
    }
}

struct ContentScroller: View {
    var body: some View {
        HStack {
            Image("virus")
                .resizable()
                .frame(width: 300, height: 200)
            
            Text("Coronavirus latest updates: Trump tests negative as Spain orders nationwide lockdown • Shutdowns spread across Europe as Spain and France order broad restrictions.")
                .frame(width: 1800, height: 42)
        }.marquee(duration: 25.0, spacing: 20)
    }
}

extension View {
    func marquee(duration: TimeInterval = 5.0, spacing: CGFloat? = nil) -> some View {
        return self.modifier(MarqueeModifier(duration: duration, spacing: spacing ?? 10))
    }
}

struct ContentScroller_Previews: PreviewProvider {
    static var previews: some View {
        ContentScroller()
    }
}
