//
//  ViewController.swift
//  World Tracking
//
//  Created by Juan Espinosa on 9/23/18.
//  Copyright © 2018 Juan Espinosa. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        self.sceneView.autoenablesDefaultLighting = true
        self.sceneView.session.run(configuration)
    }

    @IBAction func Add(_ sender: Any) {
//        let doorNode = SCNNode(geometry: SCNPlane(width: 0.03, height: 0.06))
//        let pyramidNode = SCNNode(geometry: SCNPyramid(width: 0.1, height: 0.1, length: 0.1))
//        let boxNode = SCNNode(geometry: SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0))
//
//        pyramidNode.geometry?.firstMaterial?.diffuse.contents = UIColor.red
//        pyramidNode.geometry?.firstMaterial?.specular.contents = UIColor.white
//        pyramidNode.position = SCNVector3(0, 0.05, 0)
//
//        doorNode.geometry?.firstMaterial?.diffuse.contents = UIColor.brown
//        doorNode.geometry?.firstMaterial?.specular.contents = UIColor.white
//        doorNode.position = SCNVector3(0, -0.02, 0.051)
//
//        boxNode.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
//        boxNode.geometry?.firstMaterial?.specular.contents = UIColor.white
//        boxNode.position = SCNVector3(0, 0, 0)
//
//        boxNode.addChildNode(pyramidNode)
//        boxNode.addChildNode(doorNode)
//        self.sceneView.scene.rootNode.addChildNode(boxNode)
        
        
        let pyramidNode = SCNNode(geometry: SCNPyramid(width: 0.1, height: 0.1, length: 0.1))
        pyramidNode.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        pyramidNode.position = SCNVector3(0, 0.05, 0)
        pyramidNode.eulerAngles = SCNVector3(Float(90.degreesToRadianes()), 0, 0)
        self.sceneView.scene.rootNode.addChildNode(pyramidNode)
    }
    
    @IBAction func Reset(_ sender: Any) {
        self.restartSession()
    }
    
    func restartSession() {
        self.sceneView.session.pause()
        self.sceneView.scene.rootNode.enumerateChildNodes { (node, _) in
            node.removeFromParentNode()
        }
        self.sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
    
    func getRandomNumber(minValue: CGFloat, maxValue: CGFloat) -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(minValue - maxValue) + min(minValue, maxValue)
    }
}

extension Int {
    var degreesToRadians: Double { return Double(self) * .pi/180}
    func degreesToRadianes() -> Double { return Double(self) * .pi/180 }
}

