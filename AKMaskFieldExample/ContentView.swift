//
//  ContentView.swift
//  AKMaskFieldExample
//
//  Created by Іван Богоносюк on 23.03.2020.
//  Copyright © 2020 Artem Krachulov. All rights reserved.
//

import SwiftUI
import AKMaskField

@available(iOS 13.0, *)
struct ContentView: View {
    @State var phone = ""

    var body: some View {
        ScrollView {
            SwiftUIMaskedTextField("", text: $phone, mask: "+38 ({ddd}) {ddd}-{dd}-{dd}", keyboardType: .phonePad)
                .padding(.vertical, 10.0)
                .padding(.horizontal, 25.0)
                .background(Color(red: 248 / 255, green: 248 / 255, blue: 248 / 255))
                .foregroundColor(Color(red: 66 / 255, green: 66 / 255, blue: 66 / 255))
                .cornerRadius(10)
                .fixedSize(horizontal: false, vertical: true)
        }
//        .background(Color.red)
        .padding()
        .navigationBarTitle(Text("Display"), displayMode: .inline)
        .onAppear {
            self.phone = "0978009543"
            print("phone \(self.phone)")
        }
    }
}

@available(iOS 13.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
