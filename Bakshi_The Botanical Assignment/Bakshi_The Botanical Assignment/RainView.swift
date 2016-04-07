//
//  RainView.swift
//  Bakshi_The Botanical Assignment
//
//  Created by Bakshi,Ronak on 3/30/16.
//  Copyright © 2016 Bakshi,Ronak. All rights reserved.
//

import UIKit

class RainView: UIView {
    
    var rainVC:RainViewController!
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    var randomCoordinates:[String] = ["randomt0","randomt1","randomt2","randomt3"]
    
    
    func randomt0() -> CGPoint{
        return CGPoint(x: Double(random()%500), y: Double(random()%900))
    }
    
    
//    func randomt1(point:CGPoint) -> CGPoint{
//        return CGPoint(x: 0.85 + 0.04*point.y, y: -0.04*point.x + 0.85*point.y + 1.6)
//    }
//    
//    func randomt2(point:CGPoint) -> CGPoint{
//        return CGPoint(x: 0.2*point.x - 0.26*point.y, y: 0.23*point.x + 0.22*point.y + 1.6)
//    }
//    
//    func randomt3(point:CGPoint) -> CGPoint{
//        return CGPoint(x: -0.15*point.x + 0.28*point.y, y: 0.26*point.x + 0.24*point.y + 0.44)
//    }
//    
    
    override func drawRect(rect: CGRect) {
        var colors: [String : UIColor] = ["Red":UIColor.redColor(),"Orange":UIColor.orangeColor(),"Yellow":UIColor.yellowColor(),"Green":UIColor.greenColor(),"Blue":UIColor.blueColor()]
        
        let bp:UIBezierPath = UIBezierPath()
        var point:CGPoint = randomt0()
        var radius:CGFloat = 1.0
        var numDrops:Int = 500
        var rainColor:String = "Red"
        
        if let _ = rainVC.numberOfRainDrops{
            numDrops = rainVC.numberOfRainDrops
        }
        if let _ = rainVC.dropRadius{
            radius = CGFloat(rainVC.dropRadius)
        }
        if let _ = rainVC.dropColor{
            rainColor = rainVC.dropColor
        }
        colors[rainColor]?.setStroke()
        colors[rainColor]?.setFill()
        for var i:Int = 0; i < numDrops; i++ {
//            let randomCoordinate:String = randomCoordinates[random()%4]
            bp.moveToPoint(point)
            bp.addArcWithCenter(point, radius: radius, startAngle: 0.0, endAngle: 6.28, clockwise: true)
//            if randomCoordinate == "randomt0"{
                point = randomt0()
//            }
//            if randomCoordinate == "randomt1"{
//                point = randomt1(point)
//            }
//            if randomCoordinate == "randomt2"{
//                point = randomt2(point)
//            }
//            if randomCoordinate == "randomt3"{
//                point = randomt3(point)
//            }
            bp.stroke()
            bp.fill()

        }
        
    }
}
