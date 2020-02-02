//
//  SwiftRobotControlCenter.swift
//  MyRobot
//
//  Created by Ivan Vasilevich on 10/4/14.
//  Copyright (c) 2014 Ivan Besarab. All rights reserved.
//

import UIKit
//all robot commands can be founded in GameViewController.h
class SwiftRobotControlCenter: RobotControlCenter {
    
    var SizeOfiPad:Int = 0
    
    //level name setup
    override func viewDidLoad() {
        levelName = "L55H" // level name
        
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        var RowNum:Int
        GotoStartPosition()
        RowNum = SizeOfiPad - 1
        move()
        turnRight()
        while RowNum>=1 {
        DrawString(ItemsPerString: RowNum)
        GotoNextString()
        RowNum-=1
        }
        GotoStartPosition()
        turnRight()
    }
    
    func DrawString(ItemsPerString:Int){
        
        for _ in 1...ItemsPerString {
            
            put()
            move()
            
        }
        
    }
    
    func GotoNextString(){
        
        turnRight()
        turnRight()
        while frontIsClear {
            move()
        }
        turnRight()
        if frontIsClear {
        move()
        }
        turnRight()
    }
    
    func GotoStartPosition(){
        
        turnRight()
        while frontIsClear {
            
            move()
            SizeOfiPad = SizeOfiPad + 1
            
        }
        turnLeft()
        turnLeft()
//        move()
//        turnRight()
        
    }
    
    func turnLeft(){
        
        turnRight()
        turnRight()
        turnRight()
    }
    
}
