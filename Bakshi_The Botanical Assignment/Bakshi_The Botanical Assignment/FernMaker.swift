//
//  FernMaker.swift
//  Bakshi_The Botanical Assignment
//
//  Created by Bakshi,Ronak on 3/30/16.
//  Copyright © 2016 Bakshi,Ronak. All rights reserved.
//

import Foundation
import UIKit

class FernMaker{
    
    var points:[CGPoint] = []
    //var functions:[String] = ["t0","t1","t2","t3"]
    var count:Int = 0
    func t0(point:CGPoint) -> CGPoint{
        return CGPoint(x: 0, y: 0.16*point.y)
    }
    
    func t1(point:CGPoint) -> CGPoint{
        return CGPoint(x: 0.85 * point.x + 0.04*point.y, y: -0.04*point.x + 0.85*point.y + 1.6)
    }
    
    func t2(point:CGPoint) -> CGPoint{
        return CGPoint(x: 0.2*point.x - 0.26*point.y, y: 0.23*point.x + 0.22*point.y + 1.6)
    }
    
    func t3(point:CGPoint) -> CGPoint{
        return CGPoint(x: -0.15*point.x + 0.28*point.y, y: 0.26*point.x + 0.24*point.y + 0.44)
    }
    
    func generateFern(numberOfPoints:Int){
        points.append(t0(CGPoint(x: 2.5, y: 0.5)))
        
        
        var index:Int!
        for var i:Int = 0; i < numberOfPoints; i++ {
            
            index = random()%100
            print(index)
            // print(count)
            if index < 1{
                points.append(t0(points[i]))
            }
            else if index <= 85{
                points.append(t1(points[i]))
            }
            else if index <= 94{
                points.append(t2(points[i]))
            }
            else if index <= 100 {
                points.append(t3(points[i]))
            }
            print(i)
            print(points[i])
        }
    }
}