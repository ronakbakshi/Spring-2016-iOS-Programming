//
//  Party.swift
//  Bakshi_The US Presidential App
//  @Author: S524975
//  Created by Bakshi,Ronak on 2/23/16.
//  Copyright © 2016 Bakshi,Ronak. All rights reserved.
//  Works best in iPhone6s Plus

import Foundation
class Party{
    var nameOfParty:String!
    var partiesCandidatesDictionary:[String: Candidate]!
    //Displays the candidates in the order of percentage
    func displayOrder() -> [Candidate]{
        var candidatesArray:[Candidate] = []
        for value in partiesCandidatesDictionary.values {
            candidatesArray.append(value)
        }
        candidatesArray.sortInPlace({$0.numberOfVotes>$1.numberOfVotes})
        return candidatesArray
    }
    //Returns the percentage of votes for a particular candidate in a party
    func getPercentage(candidatesName:String, candidateVotes:Int)->Double{
        var totalVotes:Double = 0.0
        for candidate:Candidate in partiesCandidatesDictionary.values{
            totalVotes += Double(candidate.numberOfVotes)
        }
        if totalVotes == 0{
            return 0.0
        }else{
            return Double(candidateVotes*100)/totalVotes
        }
    }
    //Updates the votes for a particular candidate by 1, when clicked on the particular cell
    func updateVote(candidateName: String){
        var candidateVotes = (partiesCandidatesDictionary[candidateName]?.numberOfVotes)! as Int
        candidateVotes++
        partiesCandidatesDictionary[candidateName]?.numberOfVotes = candidateVotes
    }
    //Adds a Candidate
    func addCandidate(candidate:Candidate){
        partiesCandidatesDictionary[candidate.nameOfCandidate] = candidate
    }
    init(nameOfParty:String,partiesCandidatesDictionary:[String: Candidate]){
        self.nameOfParty = nameOfParty
        self.partiesCandidatesDictionary = partiesCandidatesDictionary
    }
}