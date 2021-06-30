//
//  AddTodoView.swift
//  TodoList
//
//  Created by Sophia Lu on 6/28/21.
//

import SwiftUI

struct AddTodoView: View {
    @State var textFieldText: String = ""
    @EnvironmentObject var listVM: ListViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var alertTitle: String = ""
    @State var isAlertPresented: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                    .cornerRadius(10)

                
                Button(action: saveItem, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })

                
            }.padding(14)

        }
        .navigationTitle("Add a Todo Item 📝")
        .alert(isPresented: $isAlertPresented, content: {
            Alert(title: Text(alertTitle))
        })
    }
    
    func saveItem() {
        if textIsValid() {
            listVM.addItem(textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsValid() -> Bool {
        if textFieldText.count > 3 {
            return true
        } else {
            alertTitle = "You need more than 3 characters"
            isAlertPresented = true
            return false
        }
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddTodoView()
        }
    }
}
