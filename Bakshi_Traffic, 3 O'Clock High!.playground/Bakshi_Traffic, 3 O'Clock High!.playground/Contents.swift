//: Playground - noun: a place where people can play

/**
@Author: s524975
**/

import UIKit

//Vehicle class
class Vehicle{
    var speed:Double
    var speedInKph:Double{
        get{
            return speed*1.6
        }
    }
    func drivingSafely(maxSpeed:Double) -> Bool{
        if speed < maxSpeed{
            return true
        }
        else{
            return false
        }
    }
    func description() -> String{
        return "Speed: \(speedInKph)"
    }
    init(speed:Double){
        self.speed = speed
    }
    convenience init(){
        self.init(speed : 0.0)
    }
}

//Car is a sub-class of Vehicle

class Car : Vehicle{
    let MAX_NUM_PASSENGERS = 6
    private var _numPassengers:Int
    var numPassengers:Int{
        get{
            return _numPassengers
        }
        set{
            if (newValue >= 0) && (newValue <= MAX_NUM_PASSENGERS){
                _numPassengers = newValue
            }else{
                _numPassengers = 0
            }
        }
    }
    var deerHornInstalled:Bool
    override func description() -> String{
        return "Num Passengers: \(_numPassengers), \(super.description())"
    }
    init(speed:Double, numPassengers:Int, deerHornInstalled:Bool){
        self._numPassengers = numPassengers
        self.deerHornInstalled = deerHornInstalled
        super.init(speed : speed)
    }
    convenience init(){
        self.init(speed : 0.0, numPassengers : 0, deerHornInstalled : false)
    }
}

//Truck is a sub class of Vehicle
class Truck: Vehicle {
    
    var payload : Double
    var companyName : String
    override func description() -> String{
        return "Owned by \(companyName)"
    }
    
    init(speed:Double, payload:Double, companyName:String) {
        self.payload = payload
        self.companyName = companyName
        super.init(speed:speed)
    }
    
    convenience init(companyName:String) {
        self.init(speed:0.0,payload:0.0,companyName:companyName)
    }
    override convenience init(speed:Double){
        self.init(speed:speed, payload:0.0, companyName:"ACME")
    }
}

//TrafficMonitor is a class to keep track of the number of Trucks and Cars
class TrafficMonitor{
    var speeds:[Double]
    func registerSpeed(vehicle:Vehicle){
        speeds.append(vehicle.speedInKph)
    }
    func reset(){
        speeds.removeAll()
    }
    func minSpeed() -> Double!{
        return speeds.minElement()
    }
    func maxSpeed() -> Double!{
        return speeds.maxElement()
    }
    func medianSpeed() -> Double{
        var temp:[Double] = speeds.sort()
        if(temp.count % 2 == 0){
            return (temp[temp.count/2] + temp[temp.count/2 - 1])/2
        }
        else{
            return temp[temp.count/2]
        }
    }
    func description() -> String{
        return "speeds: \(speeds)"+"\n"+"Minimum Speed: \(minSpeed()), Maximum Speed: \(maxSpeed()), Median Speed:\(medianSpeed())"
    }
    init(){
        speeds = []
    }
}
// Test function
func simulateRoadConditions(){
    var traffic:[Vehicle] = []
    let Car0:Car = Car(speed: 50.0, numPassengers: 3, deerHornInstalled: false)
    let Car1:Car = Car(speed: 65.0, numPassengers: 4, deerHornInstalled: true)
    let Car2:Car = Car(speed: 55.0, numPassengers: 2, deerHornInstalled: false)
    let Truck0:Truck = Truck(speed: 75.0, payload: 1000.0, companyName: "Bearcat Haulers")
    let Truck1:Truck = Truck(speed: 67.0, payload: -500.0, companyName: "Lighter Than Air Transport")
    
    traffic.append(Car0)
    traffic.append(Car1)
    traffic.append(Car2)
    traffic.append(Truck0)
    traffic.append(Truck1)
    print(Car1.description())
    print(Truck0.description())
    let trafficMonitor:TrafficMonitor = TrafficMonitor()
    
    for val in traffic{
        trafficMonitor.registerSpeed(val)
    }
    
    print(trafficMonitor.description())
    trafficMonitor.reset()
    
    let Truck2:Truck = Truck(speed: 85.0, payload: 25.0, companyName: "Don't Hit the Median While Calculating the Median")
    traffic.append(Truck2)
    for val in traffic{
        trafficMonitor.registerSpeed(val)
    }
    
    print(trafficMonitor.description())
    
}

simulateRoadConditions()// simulating the testing function.









