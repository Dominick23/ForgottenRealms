//
//  Hexes.swift
//  ForgottenRealmsMap
//
//  Created by Joey Marino on 6/2/18.
//  Copyright © 2018 Joey Marino. All rights reserved.
//

/*import Foundation
import QuartzCore

class Hexes {
// Parameters that define the style
let hexSideLength: CGFloat = 15.0
let hexLineWidth: CGFloat  = 3.0

let colors = [UIColor.redColor().CGColor, NSColor.cyan, NSColor.green, NSColor.yellow, NSColor.red].map { $0.cgColor }


// The shape used at every point in the hex grid
let hexAngle = 2.0*CGFloat.pi/3.0

func pointWithAngle(angle: CGFloat, distance: CGFloat, fromPoint: CGPoint) -> CGPoint {
    return CGPoint(
        x: fromPoint.x + distance * cos(angle),
        y: fromPoint.y + distance * sin(angle)
    )
}

let center = CGPoint(x: 0, y: 0)
let points = [0, 1, 2]
    points.map { -CGFloat.pi/2.0 + hexAngle*$0 }
    points.map { pointWithAngle(angle: $0, distance: hexSideLength, fromPoint: center) }
let path = CGMutablePath()
for point in points {
    path.move(to: CGPoint(x: center.x, y: center.y))
    path.addLine(to: CGPoint(x: point.x, y: point.y))
}


// A layer hosting view, to host the shape layers
let size = CGSize(width: 250, height: 200)
let view = (frame: CGRect(origin: CGPoint(x: 0, y: 0), size: size))
let rootLayer = CALayer()
rootLayer.backgroundColor = NSColor.black.cgColor
view.layer = rootLayer // for a layer _hosting_ view
view.wantsLayer = true
PlaygroundPage.current.liveView = view


// The grid of points for the hex grid
var hexPoints:[CGPoint] = []

let rowHeight = -cos(hexAngle)*hexSideLength + hexSideLength

var isEven = true
var row: CGFloat = hexSideLength
while row < view.frame.height {
    let xOffset = isEven ? hexSideLength*sin(hexAngle) : 0.0
    var col: CGFloat = hexSideLength/2.0 - xOffset
    while col < view.frame.width + hexSideLength {
        hexPoints.append(CGPoint(x: col, y: row))
        col += 2.0*hexSideLength*sin(hexAngle)
    }
    row += rowHeight
    isEven = !isEven
}


// The two animations (rotation and color)
let timing = CAMediaTimingFunction(controlPoints: 0.85, 0.0, 0.15, 1.0)
var rotation = CABasicAnimation(keyPath: "transform.rotation.z")
rotation.fromValue      = 0.0
rotation.byValue        = -π/3.0
rotation.duration       = 1.0
rotation.repeatCount    = HUGE
rotation.timingFunction = timing
rotation.isCumulative     = true


var colorShift = CAKeyframeAnimation(keyPath: "strokeColor")
colorShift.values          = colors
colorShift.duration        = Double(colors.count-1)*rotation.duration
colorShift.repeatCount     = HUGE
colorShift.timingFunctions = [timing, timing, timing]



let viewCenter = CGPoint(x: view.frame.midX, y: view.frame.midY)
func distanceToViewCenter(point: CGPoint) -> CGFloat {
    return sqrt((point.x - viewCenter.x)*(point.x - viewCenter.x) + (point.y - viewCenter.y)*(point.y - viewCenter.y))
}


for point in hexPoints {
    let layer = CAShapeLayer()
    layer.lineWidth = hexLineWidth
    layer.position  = point
    layer.path      = path
    
    view.layer?.addSublayer(layer)
    
    let timeOffset = Double(distanceToViewCenter(point: point)/view.frame.midX)
    
    rotation.timeOffset   = -timeOffset
    colorShift.timeOffset = -timeOffset
    
    layer.add(rotation,   forKey: "spin")
    layer.add(colorShift, forKey: "shift color")
}
}
 */
