//
//  ContentView.swift
//  AKMaskFieldExample
//
//  Created by Іван Богоносюк on 24.02.2020.
//  Copyright © 2020 Artem Krachulov. All rights reserved.
//

import SwiftUI
import AKMaskField

@available(iOS 13.0, *)
struct ContentView: View {
    @State private var text: String

    var body: some View {
        VStack {
            MaskedTextField("Masked", text: $text, mask: "{dddd}")
        }
    }
}

@available(iOS 13.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(text: "")
    }
}
