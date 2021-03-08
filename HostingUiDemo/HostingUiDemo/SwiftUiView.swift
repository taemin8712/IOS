//
//  SwiftUiView.swift
//  HostingUiDemo
//
//  Created by taemmy on 2021/01/10.
//  Copyright © 2021 tm. All rights reserved.
//

import SwiftUI

struct SwiftUiView: View {
    var body: some View {
        VStack{
            Text("Telxt")
            HStack{
                Image(systemName: "smiley")
                Text("This is a SwiftUI View")
            }
        }
    }
}

struct SwiftUiView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUiView()
    }
}
