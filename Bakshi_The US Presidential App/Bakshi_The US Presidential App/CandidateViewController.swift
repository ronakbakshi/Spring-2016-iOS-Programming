//
//  ViewController.swift
//  Bakshi_The US Presidential App
//  @Author: S524975
//  Created by Bakshi,Ronak on 2/23/16.
//  Copyright © 2016 Bakshi,Ronak. All rights reserved.
//  Works best in iPhone6s Plus

import UIKit

class CandidateViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    override func viewDidLoad() {
        
        PollFactory.createModel()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return PollFactory.parties.count
        //pollFactory.parties.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PollFactory.parties[section].partiesCandidatesDictionary.count
        //section == 0 ? pollFactory.parties[0].partiesCandidatesDictionary.count : pollFactory.parties[1].partiesCandidatesDictionary.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return PollFactory.parties[section].nameOfParty!
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var candidateDetails:[Candidate] = PollFactory.parties[indexPath.section].displayOrder()
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        
        
        let candidateImage:UIImageView = cell.viewWithTag(100) as! UIImageView
        let candidateName:UILabel = cell.viewWithTag(101) as! UILabel
        let candidateVotes:UILabel = cell.viewWithTag(102) as! UILabel
        let img:String = candidateDetails[indexPath.row].imageOfCandidate
        candidateImage.image = UIImage(named: img)
        candidateName.text = candidateDetails[indexPath.row].nameOfCandidate
        candidateVotes.text = String(format:"%.2f",PollFactory.parties[indexPath.section].getPercentage(candidateDetails[indexPath.row].nameOfCandidate,candidateVotes:candidateDetails[indexPath.row].numberOfVotes))
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let object =  PollFactory.parties[indexPath.section].displayOrder()[indexPath.row]
        PollFactory.parties[indexPath.section].updateVote(object.nameOfCandidate)
        tableView.reloadData()
        
    }
}






































