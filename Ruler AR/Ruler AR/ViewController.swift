//
//  ViewController.swift
//  Ruler AR
//
//  Created by Kevin Torres on 07/08/20.
//  Copyright © 2020 Kevin Torres Martínez. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    var dotNodes = [SCNNode]()
    var lineNode = SCNNode()
    var textNode = SCNNode()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
//        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touchLocation = touches.first?.location(in: sceneView) {
            let hitTestResults = sceneView.hitTest(touchLocation, types: .featurePoint)
            
            if let hitTestResult = hitTestResults.first {
                addDot(at: hitTestResult)
            }
        }
    }
    
    func addDot(at hitResult: ARHitTestResult) {
        if dotNodes.count == 2 {
            for dotNode in dotNodes {
                dotNode.removeFromParentNode()
            }
            dotNodes = [SCNNode]()
            lineNode.removeFromParentNode()
            textNode.removeFromParentNode()
        }
        
        let dotGeometry = SCNSphere(radius: 0.0025)
        
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.yellow
        
        dotGeometry.materials = [material]
        
        let dotNode = SCNNode(geometry: dotGeometry)
        
        dotNode.position = SCNVector3(
            hitResult.worldTransform.columns.3.x,
            hitResult.worldTransform.columns.3.y,
            hitResult.worldTransform.columns.3.z)
        
        sceneView.scene.rootNode.addChildNode(dotNode)
        
        dotNodes.append(dotNode)
        
        if dotNodes.count == 2 {
            calculate()
        }
    }
    
    func calculate() {
        let start = dotNodes[0]
        let end = dotNodes[1]
        
        let x = end.position.x - start.position.x
        let y = end.position.y - start.position.y
        let z = end.position.z - start.position.z
        
        let distance = abs(sqrt(pow(x, 2) + pow(y, 2) + pow(z, 2)))
        
        updateText(text: "\(String(format: "%.2f", distance*100))cm", atPosition: end.position)
        addLine(start: start.position, end: end.position)
    }
    
    func addLine(start: SCNVector3, end: SCNVector3) {
        let linesGeometry = SCNGeometry(
            sources: [SCNGeometrySource(vertices: [start, end])],
            elements: [SCNGeometryElement(indices: [Int32]([0, 1]), primitiveType: .line)]
        )
        lineNode = SCNNode(geometry: linesGeometry)
        
        sceneView.scene.rootNode.addChildNode(lineNode)
    }
    
    func updateText(text: String,  atPosition position: SCNVector3) {
        let textGeometry = SCNText(string: text, extrusionDepth: 1.0)
        textGeometry.firstMaterial?.diffuse.contents = UIColor.yellow
        
        textNode = SCNNode(geometry: textGeometry)
        textNode.position = SCNVector3(position.x, position.y + 0.01, position.z)
        textNode.scale = SCNVector3(0.002, 0.002, 0.002)

        sceneView.scene.rootNode.addChildNode(textNode)
    }
}
