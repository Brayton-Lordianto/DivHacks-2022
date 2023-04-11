//
//  ListView.swift
//  testAR2
//
//  Created by Brayton Lordianto on 9/24/22.
//

import SwiftUI

struct ListView: View {
    @State var items = [FoodItem(classification: "orange", name: "a", quantity: 1, produceDate: Date(), expireDate: Date()),FoodItem(classification: "grape", name: "c", quantity: 1, produceDate: Date(), expireDate: Date()),FoodItem(classification: "bananas", name: "b", quantity: 1, produceDate: Date(), expireDate: Date())]
//    @State var theItems = ViewModel.items
//    @ObservedObject var vm = ViewModel()
    @EnvironmentObject var vm: ViewModel

    @State var showingSheet = false
    var body: some View {
        NavigationView {
            Form {
                List {
                    ForEach(vm.items) { item in
                        HStack {
                            Image(item.food.classification)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .scaledToFill()
                            
                            VStack {
                                Text(item.food.name)
                                    .fontWeight(.bold)
                                Text("expires in 1 day")
                            }
                        }
                    }
                }
                
            }
            .sheet(isPresented: $showingSheet) {
                EnterFruitsForm()
                    .environmentObject(vm)
            }
            .onAppear {
                // call the server get and get the items from the server
                
            }
            .toolbar {
                Button {
                    showingSheet = true
                } label: {
                    Image(systemName: "plus")
                }

            }
            .navigationTitle("What's in my fridge?")
        }
    }
}
//
//struct ListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListView()
//    }
//}
