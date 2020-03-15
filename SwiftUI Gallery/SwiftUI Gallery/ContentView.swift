//
//  ContentView.swift
//  SwiftUI Gallery
//
//  Created by Wayne Dahlberg on 3/13/20.
//  Copyright © 2020 Floppy Hat, LLC. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var text : String = "This is some very long text for a song"
    
    var body: some View {
        VStack(alignment: .leading) {
            Marquee(text: text)
        }
        .frame(width: 230, height: 30)
        .clipShape(RoundedRectangle(cornerRadius: 0, style: .continuous))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
