//
//  Candidate.swift
//  Bakshi_The US Presidential App
//  @Author: S524975
//  Created by Bakshi,Ronak on 2/23/16.
//  Copyright © 2016 Bakshi,Ronak. All rights reserved.
//  Works best in iPhone6s Plus

import Foundation
class Candidate{
    var imageOfCandidate:String
    var nameOfCandidate:String
    var numberOfVotes:Int
    init(imageOfCandidate:String,nameOfCandidate:String,numberOfVotes:Int){
        self.imageOfCandidate = imageOfCandidate
        self.nameOfCandidate = nameOfCandidate
        self.numberOfVotes = numberOfVotes
    }
}