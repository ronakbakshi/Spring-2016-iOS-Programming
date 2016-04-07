//
//  FernView.swift
//  Bakshi_The Botanical Assignment
//
//  Created by Bakshi,Ronak on 3/30/16.
//  Copyright © 2016 Bakshi,Ronak. All rights reserved.
//

import UIKit

class FernView: UIView {

    var fernMaker:FernMaker!
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        let bp:UIBezierPath = UIBezierPath()
        UIColor.blueColor().setStroke()
        UIColor.blueColor().setFill()
        var coordinate:CGPoint!
        
        for var i:Int=0; i < fernMaker.points.count; i++ {
            coordinate = CGPoint(x: CGFloat(fernMaker.points[i].x + 5 )*25, y: CGFloat(fernMaker.points[i].y + 4)*24)
           
            bp.moveToPoint(coordinate)
            bp.addArcWithCenter(coordinate, radius: 1, startAngle: 0.0, endAngle: 6.28, clockwise: true)
            bp.fill()
            print(i)
        }
    }
}
