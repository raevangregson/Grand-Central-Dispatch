//
//  ViewController.swift
//  GregsonRaevan_CE4
//
//  Created by Raevan Gregson on 2/8/17.
//  Copyright © 2017 Raevan Gregson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //this is where I set my UI to Outlets
    @IBOutlet var ipadVIEWS: [UIImageView]!
    @IBOutlet var iphoneViews: [UIImageView]!
    @IBOutlet var iphoneBackViews: [UIImageView]!
    @IBOutlet var ipadContainers: [UIView]!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    
    //I use an array to track matches two holders to track my two selection tags in the ui a timer object for my main timer and two seperate arrays to hold my cards for iphone and ipad along with a counter so I know when all matches have been found.
    var matches = [UIImageView]()
    var holder1 = 0
    var holder2 = 0
    var timer = Timer()
    var counter = 0
    var iphoneMatches = [Int:UIImage]()
    var ipadMatches = [Int:UIImage]()
    var matchCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setup()
    }
    //I do my setup in its own function and call it in the view did load so I can recall it and resetup when the user wants to play again
    func setup(){
        
        //differintiate between ipad and iphone then I load my images into each set, along with setting up two seperate arrays to shuffle and then loop through each of my two card sets and assign a random number to that match. The number thts assigned also gets assigned to its corresponding tag.
        if UIDevice.current.userInterfaceIdiom == .pad
        {
            let ipadMatchSet1 = [#imageLiteral(resourceName: "Lightbulb"),#imageLiteral(resourceName: "Brick"),#imageLiteral(resourceName: "Brain"),#imageLiteral(resourceName: "Chainsaw"),#imageLiteral(resourceName: "Saw"),#imageLiteral(resourceName: "Eye"),#imageLiteral(resourceName: "Zombie"),#imageLiteral(resourceName: "Flame"),#imageLiteral(resourceName: "Green Magic"),#imageLiteral(resourceName: "Treasure Chest"),#imageLiteral(resourceName: "Vault"),#imageLiteral(resourceName: "Casino Chip"),#imageLiteral(resourceName: "Rope"),#imageLiteral(resourceName: "Das Cool"),#imageLiteral(resourceName: "Blue Magic")];
            var ipadMatchSet2 = [UIImage]()
            ipadMatchSet2 = ipadMatchSet1
            let ipadArray1:[Int] = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14]
            let ipadArray2:[Int] = [15,16,17,18,19,20,21,22,23,24,25,26,27,28,29]
            let shuffledIpadArray1 = shuffle(list: ipadArray1)
            let shuffledIpadArray2 = shuffle(list: ipadArray2)
            for view in ipadContainers
            {
                view.layer.cornerRadius = 15
                view.layer.masksToBounds = true
                view.layer.shouldRasterize = true
            }
            for (view,number) in zip(ipadMatchSet1,shuffledIpadArray1)
            {
                ipadMatches[number] = view
            }
            for (view,number) in zip(ipadMatchSet2,shuffledIpadArray2)
            {
                ipadMatches[number] = view
            }
            
            for view in ipadVIEWS
            {
                view.image = #imageLiteral(resourceName: "Memory")
            }
        }
        else if UIDevice.current.userInterfaceIdiom == .phone
        {
            let iphoneMatchSet1:[UIImage] = [#imageLiteral(resourceName: "Lightbulb"),#imageLiteral(resourceName: "Brick"),#imageLiteral(resourceName: "Brain"),#imageLiteral(resourceName: "Chainsaw"),#imageLiteral(resourceName: "Saw"),#imageLiteral(resourceName: "Eye"),#imageLiteral(resourceName: "Zombie"),#imageLiteral(resourceName: "Flame"),#imageLiteral(resourceName: "Green Magic"),#imageLiteral(resourceName: "Treasure Chest")];
            var iphoneMatchSet2 = [UIImage]()
            iphoneMatchSet2 = iphoneMatchSet1
            let iphoneArray1:[Int] = [0,1,2,3,4,5,6,7,8,9]
            let iphoneArray2:[Int] = [10,11,12,13,14,15,16,17,18,19]
            let shuffledIphoneArray1 = shuffle(list: iphoneArray1)
            let shuffledIphoneArray2 = shuffle(list: iphoneArray2)
            for view in ipadContainers
            {
                view.layer.cornerRadius = 15
                view.layer.masksToBounds = true
                view.layer.shouldRasterize = true
            }
            for (view,number) in zip(iphoneMatchSet1,shuffledIphoneArray1)
            {
                iphoneMatches[number] = view
            }
            for (view,number) in zip(iphoneMatchSet2,shuffledIphoneArray2)
            {
                iphoneMatches[number] = view
            }
            for view in iphoneViews
            {
                view.image = #imageLiteral(resourceName: "Memory")
            }
        }
    }
    
    //Once start game is hit I flash the cards and then set there image to the back image after 5 seconds using a timer this is where I loop through as stated above and match the corresponding view with its tag - both in iphone and ipad
    @IBAction func startGame(_ sender: UIButton)
    {
        timer = Timer(timeInterval: 1.0, target: self, selector: #selector(ViewController.count), userInfo: nil, repeats: true)
        RunLoop.current.add(timer, forMode: RunLoopMode.commonModes)
        startButton.isEnabled = false
        startButton.setTitle("", for: .disabled)
        
        if UIDevice.current.userInterfaceIdiom == .pad
        {
            _ = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(ipadFlash), userInfo: nil, repeats: false)
            
            
            for views in ipadVIEWS{
                switch views.tag{
                case 0:
                    views.image = ipadMatches[0]
                    
                case 1:
                    views.image = ipadMatches[1]
                    
                case 2:
                    views.image = ipadMatches[2]
                    
                case 3:
                    views.image = ipadMatches[3]
                    
                case 4:
                    views.image = ipadMatches[4]
                    
                case 5:
                    views.image = ipadMatches[5]
                    
                case 6:
                    views.image = ipadMatches[6]
                    
                case 7:
                    views.image = ipadMatches[7]
                    
                case 8:
                    views.image = ipadMatches[8]
                    
                case 9:
                    views.image = ipadMatches[9]
                    
                case 10:
                    views.image = ipadMatches[10]
                    
                case 11:
                    views.image = ipadMatches[11]
                    
                case 12:
                    views.image = ipadMatches[12]
                    
                case 13:
                    views.image = ipadMatches[13]
                    
                case 14:
                    views.image = ipadMatches[14]
                    
                case 15:
                    views.image = ipadMatches[15]
                    
                case 16:
                    views.image = ipadMatches[16]
                    
                case 17:
                    views.image = ipadMatches[17]
                    
                case 18:
                    views.image = ipadMatches[18]
                    
                case 19:
                    views.image = ipadMatches[19]
                    
                case 20:
                    views.image = ipadMatches[20]
                    
                case 21:
                    views.image = ipadMatches[21]
                    
                case 22:
                    views.image = ipadMatches[22]
                    
                case 23:
                    views.image = ipadMatches[23]
                    
                case 24:
                   views.image = ipadMatches[24]
                    
                case 25:
                    views.image = ipadMatches[25]
                    
                case 26:
                    views.image = ipadMatches[26]
                    
                case 27:
                    views.image = ipadMatches[27]
                    
                case 28:
                   views.image = ipadMatches[28]
                    
                case 29:
                    views.image = ipadMatches[29]
                    
                default:
                    break
                }
            }
        }
        else if UIDevice.current.userInterfaceIdiom == .phone
        {
            _ = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(iphoneFlash), userInfo: nil, repeats: false)
            
            for (view,views) in zip(iphoneBackViews,iphoneViews){
                switch view.tag{
                case 0:
                    view.image = iphoneMatches[0]
                    views.image = iphoneMatches[0]
                case 1:
                    view.image = iphoneMatches[1]
                    views.image = iphoneMatches[1]
                case 2:
                    view.image = iphoneMatches[2]
                    views.image = iphoneMatches[2]
                case 3:
                    view.image = iphoneMatches[3]
                    views.image = iphoneMatches[3]
                case 4:
                    view.image = iphoneMatches[4]
                    views.image = iphoneMatches[4]
                case 5:
                    view.image = iphoneMatches[5]
                    views.image = iphoneMatches[5]
                case 6:
                    view.image = iphoneMatches[6]
                    views.image = iphoneMatches[6]
                case 7:
                    view.image = iphoneMatches[7]
                    views.image = iphoneMatches[7]
                case 8:
                    view.image = iphoneMatches[8]
                    views.image = iphoneMatches[8]
                case 9:
                    view.image = iphoneMatches[9]
                    views.image = iphoneMatches[9]
                case 10:
                    view.image = iphoneMatches[10]
                    views.image = iphoneMatches[10]
                case 11:
                    view.image = iphoneMatches[11]
                    views.image = iphoneMatches[11]
                case 12:
                    view.image = iphoneMatches[12]
                    views.image = iphoneMatches[12]
                case 13:
                    view.image = iphoneMatches[13]
                    views.image = iphoneMatches[13]
                case 14:
                    view.image = iphoneMatches[14]
                    views.image = iphoneMatches[14]
                case 15:
                    view.image = iphoneMatches[15]
                    views.image = iphoneMatches[15]
                case 16:
                    view.image = iphoneMatches[16]
                    views.image = iphoneMatches[16]
                case 17:
                    view.image = iphoneMatches[17]
                    views.image = iphoneMatches[17]
                case 18:
                    view.image = iphoneMatches[18]
                    views.image = iphoneMatches[18]
                case 19:
                    view.image = iphoneMatches[19]
                    views.image = iphoneMatches[19]
                default:
                    break;
                }
            }
        }
    }
    
    //Once and image is tapped I check the count if it is the first match I add to my array, once there are two I compare there images
    func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        if UIDevice.current.userInterfaceIdiom == .pad
        {
            let view = tapGestureRecognizer.view
            print(view!.tag)
            if matches.count == 0{
                ipadVIEWS[(view?.tag)!].image = ipadMatches[(view?.tag)!]
                holder1 = (view?.tag)!
                matches.append(ipadVIEWS[(view?.tag)!])
            }
            else if matches.count == 1{
                ipadVIEWS[(view?.tag)!].image = ipadMatches[(view?.tag)!]
                sleep(UInt32(0.5))
                holder2 = (view?.tag)!
                matches.append(ipadVIEWS[(view?.tag)!])
                _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: false)
            }
        }
        else if UIDevice.current.userInterfaceIdiom == .phone
        {
            let view = tapGestureRecognizer.view
            if matches.count == 0{
                iphoneViews[(view?.tag)!].image = iphoneMatches[(view?.tag)!]
                holder1 = (view?.tag)!
                matches.append(iphoneViews[(view?.tag)!])
            }
            else if matches.count == 1{
                iphoneViews[(view?.tag)!].image = iphoneMatches[(view?.tag)!]
                sleep(UInt32(0.5))
                holder2 = (view?.tag)!
                matches.append(iphoneViews[(view?.tag)!])
                _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: false)
            }
        }
    }
    //then if they are the same add to my match count flip over and disable user interaction. Once 10 or 15 matches is made depending on iphone or ipad I then dactivate the time and have my pop present
    func timerAction()
    {
        if UIDevice.current.userInterfaceIdiom == .phone
        {
            if matchCount < 10{
            if matches[0].image == matches[1].image
            {
                matchCount += 1
                iphoneViews[holder1].image = nil
                iphoneViews[holder1].backgroundColor = UIColor(red: 220/255, green: 65/255, blue: 76/255, alpha: 1)
                iphoneViews[holder2].image = nil
                iphoneViews[holder2].backgroundColor = UIColor(red: 220/255, green: 65/255, blue: 76/255, alpha: 1)
                iphoneViews[holder1].isUserInteractionEnabled = false
                iphoneViews[holder2].isUserInteractionEnabled = false
            }
            else
            {
                iphoneViews[holder1].image = #imageLiteral(resourceName: "Memory")
                iphoneViews[holder2].image = #imageLiteral(resourceName: "Memory")
            }
            matches.removeAll()
            if matchCount == 10{
                timer.invalidate()
                let alert = UIAlertController(title: "You Win!", message: "Final Time:"+timerLabel.text!, preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler:nil))
                self.present(alert, animated: true, completion: nil)
                startButton.isEnabled = true
                startButton.setTitle("Play", for:.normal)
                counter = -1
                count()
                matchCount = 0
                setup()
                }
            }
        }
        else if UIDevice.current.userInterfaceIdiom == .pad
        {
            if matchCount < 15{
            if matches[0].image == matches[1].image
            {
                matchCount += 1
                ipadVIEWS[holder1].image = nil
                ipadVIEWS[holder1].backgroundColor = UIColor(red: 220/255, green: 65/255, blue: 76/255, alpha: 1)
                ipadVIEWS[holder2].image = nil
                ipadVIEWS[holder2].backgroundColor = UIColor(red: 220/255, green: 65/255, blue: 76/255, alpha: 1)
                ipadVIEWS[holder1].isUserInteractionEnabled = false
                ipadVIEWS[holder1].isUserInteractionEnabled = false
                
            }
            else
            {
                ipadVIEWS[holder1].image = #imageLiteral(resourceName: "Memory")
                ipadVIEWS[holder2].image = #imageLiteral(resourceName: "Memory")
            }
            matches.removeAll()
                
                if matchCount == 15{
                    timer.invalidate()
                let alert = UIAlertController(title: "You Win!", message: "Final Time:"+timerLabel.text!, preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler:nil))
                    self.present(alert, animated: true, completion: nil)
                    startButton.isEnabled = true
                    startButton.setTitle("Play", for:.normal)
                    counter = -1
                    count()
                    matchCount = 0
                    setup()
                }
            }
        }
    }
    
    // this is where I assign my gesture recognizers and enable user interaction
    func ipadFlash()
    {

        for view in ipadVIEWS
        {
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
            view.isUserInteractionEnabled = true
            view.addGestureRecognizer(tapGestureRecognizer)
            view.image = #imageLiteral(resourceName: "Memory")
        }
    }
    // this is where I assign my gesture recognizers and enable user interaction
    func iphoneFlash()
    {
        for view in iphoneViews
        {
            view.image = #imageLiteral(resourceName: "Memory")
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
            view.isUserInteractionEnabled = true
            view.addGestureRecognizer(tapGestureRecognizer)
        }
    }
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //this is where I change my timer to minutes and seconds
    func count(){
        counter += 1
        
        let minutes = String(counter / 60)
        let seconds = String(counter % 60)
        if Int(seconds)! < 10{
            timerLabel.text = minutes + ":0" + seconds
        }
        else{
            timerLabel.text = minutes + ":" + seconds
        }
    }
    
    //this is where I shuffle my cards so they are random spots every time
    func shuffle<C: MutableCollection>( list: C) -> C where C.Index == Int
    {
        var list = list
        let c = list.count as! Int
        if c < 2
        {
            return list
        }
        for i in 0..<(c - 1)
        {
            let j = Int(arc4random_uniform(UInt32(c - i))) + i
            if i != j
            {
                swap(&list[i], &list[j])
            }
        }
        return list
    }
}

