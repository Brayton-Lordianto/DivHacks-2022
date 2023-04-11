//
//  ContentView.swift
//  testAR2
//
//  Created by Brayton Lordianto on 9/23/22.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    @ObservedObject var vm = ViewModel()
    var body: some View {
//        return ARViewContainer().edgesIgnoringSafeArea(.all)
        NavigationView {
            TabView {
                ListView()
                    .environmentObject(vm)
                    .tabItem {
                        Label("Folder", systemImage: "folder")
                    }
                
                NavigationLink(destination: {
                    FridgeARView()
                        .environmentObject(vm)
                }, label: {
                    Text("Look in your fridge!")
                })
                .environmentObject(vm)
                    .tabItem {
                        Label("Send", systemImage: "paperplane")
                    }
            }
        }
    }
}

//struct ARViewContainer: UIViewRepresentable {
//
//    func makeUIView(context: Context) -> ARView {
//
//        let arView = ARView(frame: .zero)
//
//        // Load the "Box" scene from the "Experience" Reality File
//        let boxAnchor = try! Experience.loadBox()
//
//        // Add the box anchor to the scene
//        arView.scene.anchors.append(boxAnchor)
//
//        //
//        arView.installGestures([.all], for: boxAnchor as! HasCollision)
//
//        return arView
//
//    }
//
//    func updateUIView(_ uiView: ARView, context: Context) {}
//
//}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
