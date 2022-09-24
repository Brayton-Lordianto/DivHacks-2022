//
//  EnterFruitsForm.swift
//  testAR2
//
//  Created by Brayton Lordianto on 9/24/22.
//

import SwiftUI

struct EnterFruitsForm: View {
    @Environment(\.presentationMode) var presentationMode
    @State var itemType = ItemType.other
    @State var name = ""
    @State var quantity = 0
    @State var produceDate = Date()
    @State var expireDate = Date()
    @EnvironmentObject var vm: ViewModel
    var body: some View {
        Form {
            Picker("Type:", selection: $itemType) {
                ForEach(ItemType.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }
            .pickerStyle(.menu)

            TextField("Label:", text: $name)

            
            DatePicker(selection: $produceDate, displayedComponents: .date) {
                Text("When did you buy this item?")
            }
            
            DatePicker(selection: $expireDate, in: Date()..., displayedComponents: .date) {
                Text("When does the item expire/ When do you want to eat the item? ")
            }
            
            
            Section {
                Button("Submit"){
                    vm.items = vm.items + [FoodItem(classification: itemType.rawValue, name: name, quantity: quantity, produceDate: produceDate, expireDate: expireDate)]
                    ServerPostHandler().addFood(type: itemType, name: name, quantity: quantity, produceDate: produceDate, expireDate: expireDate)
                    presentationMode.wrappedValue.dismiss()
                }
            }
            
            Section {
                Button("Cancel"){
                    presentationMode.wrappedValue.dismiss()
                }
                    .foregroundColor(.red)
            }
        }
    }
}

//struct EnterFruitsForm_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            EnterFruitsForm(vm:())
//        }
//    }
//}
