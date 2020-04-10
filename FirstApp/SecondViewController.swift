//
//  SecondViewController.swift
//  FirstApp
//
//  Created by 90306193 on 2/7/20.
//  Copyright © 2020 JohnnyHartle. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var betvalue = 0
    
    var usertotal = 
    
    var Started = false
    
    @IBOutlet weak var PlayerCard1: UIImageView!
    
    @IBOutlet weak var PlayerCard2: UIImageView!
    
    @IBOutlet weak var PlayerCard3: UIImageView!
    
    @IBOutlet weak var PlayerCard4: UIImageView!
    
    @IBOutlet weak var PlayerCard5: UIImageView!
    
    
    
    @IBOutlet weak var DealerCard1: UIImageView!
    
    
    @IBOutlet weak var DealerCard2: UIImageView!
    
    @IBOutlet weak var DealerCard3: UIImageView!
    
    @IBOutlet weak var DealerCard4: UIImageView!
    
    @IBOutlet weak var DealerCard5: UIImageView!
    
    
    @IBOutlet weak var WinLoseLabel: UIImageView!
    
    
    @IBOutlet weak var BetAmountLabel: UILabel!
    
    
    @IBOutlet weak var UserTotalLabel: UILabel!
    
    
    @IBAction func bet1Button(_ sender: UIButton) {
        if usertotal - 1 >= 0 && Started == false{
            betvalue += 1
            BetAmountLabel.text = "Bet Amount: \(betvalue)"
            usertotal -= 1
            UserTotalLabel.text = "Your Money: \(usertotal)"
        }
    }
    
    
    @IBAction func bet5Button(_ sender: UIButton) {
        if usertotal - 5 >= 0 && Started == false{
            betvalue += 5
            BetAmountLabel.text = "Bet Amount: \(betvalue)"
            usertotal -= 5
            UserTotalLabel.text = "Your Money: \(usertotal)"
        }
    }
    
    
    @IBAction func bet10Button(_ sender: UIButton) {
        if usertotal - 10 >= 0 && Started == false{
            betvalue += 10
            BetAmountLabel.text = "Bet Amount: \(betvalue)"
            usertotal -= 5
            UserTotalLabel.text = "Your Money: \(usertotal)"
        }
    }
    
    
    @IBAction func bet20Button(_ sender: UIButton) {
        if usertotal - 20 >= 0 && Started == false{
            betvalue += 20
            BetAmountLabel.text = "Bet Amount: \(betvalue)"
            usertotal -= 20
            UserTotalLabel.text = "Your Money: \(usertotal)"
        }
    }
    
   
    @IBAction func bet50Button(_ sender: UIButton) {
        if usertotal - 50 >= 0 && Started == false{
            betvalue += 50
            BetAmountLabel.text = "Bet Amount: \(betvalue)"
            usertotal -= 50
            UserTotalLabel.text = "Your Money: \(usertotal)"
        }
    }
    
   
    @IBAction func bet100Button(_ sender: UIButton) {
        if usertotal - 100 >= 0 && Started == false {
            betvalue += 100
            BetAmountLabel.text = "Bet Amount: \(betvalue)"
            usertotal -= 100
            UserTotalLabel.text = "Your Money: \(usertotal)"
        }
    }
    
    var playerstartvalue = 0
    
    var dealerstartvalue = 0
    
    var hitcount = 0
    
    var canhit = true
    
    var dealercardcount = 0
    
    var aceplayed = false
    
    @IBAction func DealMeInButton(_ sender: UIButton) {
        Started = true
        canhit = true
        aceplayed = false
        WinLoseLabel.image = UIImage(named: "nill")
        let firstnum = Int.random(in: 1...52)
        let firstcardvalue = CheckCardValue(x: firstnum)
        let secondnum = Int.random(in: 1...52)
        let secondcardvalue = CheckCardValue(x: secondnum)
        let thirdnum = Int.random(in: 1...52)
        let thirdcardvalue = CheckCardValue(x: thirdnum)
        
        //changing image of the cards
        PlayerCard1.image =   UIImage(named:"c\(firstnum)")
        PlayerCard2.image = UIImage(named:"c\(secondnum)")
        PlayerCard3.image = UIImage(named:"nill")
        PlayerCard4.image = UIImage(named:"nill")
        PlayerCard5.image = UIImage(named:"nill")
       
        DealerCard1.image = UIImage(named:"c\(thirdnum)")
        DealerCard2.image = UIImage(named:"Red_back")
        DealerCard3.image = UIImage(named:"nill")
        DealerCard4.image = UIImage(named:"nill")
        DealerCard5.image = UIImage(named:"nill")
        playerstartvalue = firstcardvalue + secondcardvalue
        dealerstartvalue = thirdcardvalue
    }
    
    @IBAction func HitButton(_ sender: UIButton) {
        var randomnum = 0
        var cardvalue = 0
        if Started == true && canhit == true {
            hitcount += 1
            randomnum = Int.random(in: 1...52)
            cardvalue = CheckCardValue(x: randomnum)
            if hitcount == 1 {
                PlayerCard3.image = UIImage(named:"c\(randomnum)")
            } else if hitcount == 2 {
                PlayerCard4.image = UIImage(named:"c\(randomnum)")
            } else if hitcount == 3 {
                PlayerCard5.image = UIImage(named:"c\(randomnum)")
            }
            playerstartvalue += cardvalue
            if playerstartvalue > 21 && aceplayed == true {
                playerstartvalue -= 10
                aceplayed = false 
            }
            if playerstartvalue > 21 {
                Started = false
                WinLoseLabel.image = UIImage(named: "YouLose")
                hitcount = 0
                betvalue = 0
                dealercardcount = 0
                BetAmountLabel.text = "Bet Amount: \(betvalue)"
                UserTotalLabel.text = "Your Money: \(usertotal)"
            }
            
        }
    }
    
    @IBAction func StayButton(_ sender: UIButton) {
        var randomnum = 0
        var cardvalue = 0
        if Started == true {
            canhit = false
            dealercardcount += 1
            randomnum = Int.random(in: 1...52)
            cardvalue = CheckCardValue(x: randomnum)
            if dealercardcount == 1 {
                DealerCard2.image = UIImage(named:"c\(randomnum)")
            } else if dealercardcount == 2 {
                DealerCard3.image = UIImage(named:"c\(randomnum)")
            } else if dealercardcount == 3 {
                DealerCard4.image = UIImage(named:"c\(randomnum)")
            } else if dealercardcount == 4 {
                DealerCard5.image = UIImage(named:"c\(randomnum)")
            }
            dealerstartvalue += cardvalue
            if dealerstartvalue > 21 && aceplayed == true {
                dealerstartvalue -= 10
                aceplayed = false
            }
            if dealerstartvalue > 21 {
                Started = false
                WinLoseLabel.image = UIImage(named: "YouWin")
                hitcount = 0
                dealercardcount = 0
                usertotal += (betvalue * 2)
                betvalue = 0
                BetAmountLabel.text = "Bet Amount: \(betvalue)"
                UserTotalLabel.text = "Your Money: \(usertotal)"
            } else if dealerstartvalue > 16 {
                if dealerstartvalue == playerstartvalue{
                    Started = false
                    WinLoseLabel.image = UIImage(named: "Push")
                    hitcount = 0
                    dealercardcount = 0
                    usertotal += betvalue
                    betvalue = 0
                    BetAmountLabel.text = "Bet Amount: \(betvalue)"
                    UserTotalLabel.text = "Your Money: \(usertotal)"
                } else if dealerstartvalue > playerstartvalue{
                    Started = false
                    WinLoseLabel.image = UIImage(named: "YouLose")
                    hitcount = 0
                    dealercardcount = 0
                    betvalue = 0
                    BetAmountLabel.text = "Bet Amount: \(betvalue)"
                    UserTotalLabel.text = "Your Money: \(usertotal)"
                } else if dealerstartvalue < playerstartvalue{
                    Started = false
                    WinLoseLabel.image = UIImage(named: "YouWin")
                    hitcount = 0
                    dealercardcount = 0
                    usertotal += (betvalue * 2)
                    betvalue = 0
                    BetAmountLabel.text = "Bet Amount: \(betvalue)"
                    UserTotalLabel.text = "Your Money: \(usertotal)"
                }
            }
        }
    }
    
    func CheckCardValue (x: Int) -> Int {
        var finalreturn = 0
        if x < 5 {
            finalreturn = 2
        } else if 4 < x && x < 9 {
            finalreturn = 3
        } else if 8 < x && x < 13 {
            finalreturn = 4
        } else if 12 < x && x < 17 {
            finalreturn = 5
        } else if 16 < x && x < 21 {
            finalreturn = 6
        } else if 20 < x && x < 25 {
            finalreturn = 7
        } else if 24 < x && x < 29 {
            finalreturn = 8
        } else if 28 < x && x < 33 {
            finalreturn = 9
        } else if 32 < x && x < 37 {
            finalreturn = 10
        } else if 36 < x && x < 41 {
            finalreturn = 10
        } else if 40 < x && x < 45 {
            finalreturn = 10
        } else if 44 < x && x < 49 {
            finalreturn = 10
        } else if 48 < x && x < 53 {
            finalreturn = 11
            aceplayed = true
        }
        return finalreturn
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
