//
//  GalleryRow.swift
//  SwiftUI Gallery
//
//  Created by Wayne Dahlberg on 3/13/20.
//  Copyright © 2020 Floppy Hat, LLC. All rights reserved.
//

import SwiftUI

struct GalleryRow: View {
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: "circle.fill")
            Text("Gallery item")
            Spacer()
        }
        
    }
}

struct GalleryRow_Previews: PreviewProvider {
    static var previews: some View {
        GalleryRow()
    }
}
