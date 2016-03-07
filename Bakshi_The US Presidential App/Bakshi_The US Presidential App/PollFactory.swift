//
//  PollFactory.swift
//  Bakshi_The US Presidential App
//  @Author: S524975
//  Created by Bakshi,Ronak on 2/23/16.
//  Copyright © 2016 Bakshi,Ronak. All rights reserved.
//  Works best in iPhone6s Plus

import Foundation
class PollFactory{
    
    static var parties:[Party]=[]
    static  func createModel(){
        
        let candidate1:Candidate = Candidate(imageOfCandidate:"clinton-2016.jpg",nameOfCandidate:"Clinton",numberOfVotes:0)
        let candidate2:Candidate = Candidate(imageOfCandidate:"berniesanders.jpg",nameOfCandidate:"Sanders",numberOfVotes:0)
        let party0:Party! = Party(nameOfParty: "Democratic", partiesCandidatesDictionary: ["Clinton" : candidate1])
        party0.addCandidate(candidate2)
        parties.append(party0)
        let candidate3:Candidate = Candidate(imageOfCandidate:"bencarson.jpg",nameOfCandidate:"Carson",numberOfVotes:0)
        let candidate4:Candidate = Candidate(imageOfCandidate:"TedCruz.jpg",nameOfCandidate:"Cruz",numberOfVotes:0)
        let candidate5:Candidate = Candidate(imageOfCandidate:"Kasich16.jpg",nameOfCandidate:"Kasich",numberOfVotes:0)
        let candidate6:Candidate = Candidate(imageOfCandidate:"MarcoRubio.jpg",nameOfCandidate:"Rubio",numberOfVotes:0)
        let candidate7:Candidate = Candidate(imageOfCandidate:"trump.jpg",nameOfCandidate:"Trump",numberOfVotes:0)
        let party1:Party = Party(nameOfParty: "Republic", partiesCandidatesDictionary: ["Carson" : candidate3])
        party1.addCandidate(candidate4)
        party1.addCandidate(candidate5)
        party1.addCandidate(candidate6)
        party1.addCandidate(candidate7)
        parties.append(party1)
    }
}