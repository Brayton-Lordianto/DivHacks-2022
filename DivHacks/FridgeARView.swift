//
//  FridgeARView.swift
//  testAR2
//
//  Created by Brayton Lordianto on 9/23/22.
//

import SwiftUI
import ARKit
import RealityKit

struct FridgeARView: View {
    var body: some View {
        FridgeARContainer()
            .edgesIgnoringSafeArea(.all)
    }
}

struct FridgeARContainer: UIViewRepresentable {
    var vm = EchoViewModel()
    @EnvironmentObject var vm2: ViewModel
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
//        let boxAnchor = try! Experience.loadBox()
        // Start AR session
        let session = arView.session
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        session.run(config)
        
        // Add coaching overlay
//        let coachingOverlay = ARCoachingOverlayView()
//        coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        coachingOverlay.session = session
//        coachingOverlay.goal = .horizontalPlane
//        arView.addSubview(coachingOverlay)
        
        // add each of the elements in the fridge
//        let x = ["bananas", "grape", "orange"]
        var x = [String]()
        for i in vm2.items {
            x.append(i.food.classification)
        }
//        let x = globalArray
        let anchor = AnchorEntity()
        // add each childs
        var count: Float = 0
        for group in x {
            guard
                let storageID = vm.fileNameTostorageID[group + ".usdz"],
                let entity = EchoUsdzFileManager.getAsModelEntity(storageID)
            else { print("DEBUG: NO MODEL IN ARVIEW"); return arView }
            entity.position.x += 0.3 * count
//            entity.position += SIMD3(0.3 * count, 0, 0.3)
            count += 1
            anchor.addChild(entity)
            arView.installGestures([.all], for: entity)
        }
        arView.scene.addAnchor(anchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}


//struct FridgeARView_Previews: PreviewProvider {
//    static var previews: some View {
//        FridgeARView()
//    }
//}
