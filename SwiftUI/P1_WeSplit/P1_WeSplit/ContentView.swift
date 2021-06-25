//
//  ContentView.swift
//  P1_WeSplit
//
//  Created by Sophia Lu on 6/24/21.
//

import SwiftUI

struct ContentView: View {
    // some means always be the same kind of view being returned
    @State private var tapCount = 0
    @State private var name = ""
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = 0
    @State private var selectedFlavor = Flavor.chocolate
    var body: some View {
        //Forms are scrolling lists of static controls like text and images,  but can also include user interactive controls like text fields, toggle switches, buttons, and more.
//
//        NavigationView {
//            // Form can only hold 10 items
//            Form {
//                //Groups don’t actually change the way your user interface looks, they just let us work around SwiftUI’s limitation of ten child views inside a parent
//                Group {
//                    Text("Hello World")
//                    Text("Hello World")
//                    Text("Hello World")
//                    Text("Hello World")
//                    Text("Hello World")
//                    Text("Hello World")
//                }
//
//                Group {
//                    Text("Hello World")
//                    Text("Hello World")
//                    Text("Hello World")
//                    Text("Hello World")
//                    Text("Hello World")
//                }
//            }.navigationBarTitle(Text("SwiftUI"), displayMode: .inline)
//        Form {
//            Button("Tap Count \(tapCount)", action: {
//                tapCount += 1
//            })
//
//            // two way binding: In the case of our text field, Swift needs to make sure whatever is in the text is also in the name property
//            TextField("Enter your name", text: $name)
//            Text("Your name is \(name)")
//        }
        
        VStack {
            Button("Tap Count \(tapCount)", action: {
                tapCount += 1
            })
            Picker("Select your student", selection: $selectedStudent) {
                ForEach(0..<students.count) {
                    Text(self.students[$0])
                }
            }
            
            Picker("Flavor", selection: $selectedFlavor) {
                Text("Chocolate").tag(Flavor.chocolate)
                Text("Vanilla").tag(Flavor.vanilla)
                Text("Strawberry").tag(Flavor.strawberry)
            }
            Text("Selected flavor: \(selectedFlavor.rawValue)")
            
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
