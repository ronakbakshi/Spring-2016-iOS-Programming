//
//  MathTeacher.swift
//  The Math Teacher: A Tabberific Assignment!
//  @Author: S524975
//  Created by Bakshi,Ronak on 2/9/16.
//  Copyright © 2016 Bakshi,Ronak. All rights reserved.
//
//  This application is suitable to work for iPhone 6s Plus

import Foundation
class MathTeacher{
    var operand1:Int = 1
    var operand2:Int = 1
    
    var operation:OperationType!
    var maximumProblemSize:Int = 9
    
    var history:String = ""
    
    func makeNewProblem() -> Int?{//This function generates a random number and returns the same
        return random() % maximumProblemSize
    }
    
    func answerIsCorrect(result:Int, operation:OperationType)->Bool{//This function checks if the answer entered by the user is correct or not
        switch operation {
        case .Plus :
            
            let decision =  (operand1 + operand2 ) == result
            
            //history.appendContentsOf("\(operand1)+\(operand2)=\(decision)")
            return decision
            
        case .Minus:
            
            let decision = (operand1 - operand2 ) == result
            
            //history.appendContentsOf("\(operand1)-\(operand2)=\(decision)")
            return decision
        }
    }
}
