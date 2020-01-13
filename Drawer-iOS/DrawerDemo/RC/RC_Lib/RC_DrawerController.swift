//****************************************************************************************
//  RC_DrawerController.swift
//
//  Copyright (C) 2020 Reflect Code Technologies (OPC) Pvt. Ltd.
//  For detailed please check - http://ReflectCode.com
//
//  Description - Swift implementation of Android DrawerLayout class
//                https://developer.android.com/reference/android/support/v4/widget/DrawerLayout.html
// 				  ToDo :- Drawer slide animation needs fine tuning
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this 
//  software and associated documentation files (the "Software"), to deal in the Software 
//  without restriction, including without limitation the rights to use, copy, modify, merge,
//  publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons 
//  to whom the Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all copies or 
//  substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING 
//  BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND 
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, 
//  DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//****************************************************************************************

import Foundation
import UIKit

@objc public protocol RC_DrawerChangeHandler {
    
    @objc optional func onDrawerOpened(_ drawerView : UIView?)
    @objc optional func onDrawerClosed(_ drawerView : UIView?)
    @objc optional func onDrawerSlide(_ drawerView : UIView?, _ slideOffset : Float)
    @objc optional func onDrawerStateChanged(_ newState : Int)  // RC_DrawerController.DrawerState
}

public class RC_DrawerController : NSObject {
    var drawerView : UIView?
    var mainView : UIView?
    var leadingConstraint : NSLayoutConstraint?
    var drawerChangeHandler : RC_DrawerChangeHandler? = nil
    
	private var direction : RC_Gravity = RC_Gravity.START
    private var drawerOpen : Bool = false
    private var drawerVisible : Bool = false
    
    public func isDrawerOpen(_ gravity : RC_Gravity) -> Bool {
        return drawerOpen
    }
    
    public func isDrawerVisible(_ gravity : RC_Gravity) -> Bool {
        return drawerVisible
    }


    @objc public enum DrawerState: Int {
        case STATE_IDEL = 0, STATE_DRAGGING, STATE_SETTLINE
    }
    
    
    public init(drawerView : UIView, mainView : UIView, leadingConstraint : NSLayoutConstraint, drawerChangeHandler : RC_DrawerChangeHandler?){
        super.init()
        
        self.drawerView = drawerView
        self.mainView = mainView
        self.leadingConstraint = leadingConstraint
        self.drawerChangeHandler = drawerChangeHandler
        self.leadingConstraint?.constant = 0.0 - (self.drawerView?.frame.width)! - 20.0
  
        self.drawerView!.layer.shadowColor = UIColor.black.cgColor
        self.drawerView!.layer.shadowOpacity = 0.5
        self.drawerView!.layer.shadowRadius = 8.0

        self.mainView?.bringSubviewToFront(self.drawerView!)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(RC_DrawerController.tapGestureHandler(_:)))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        self.mainView!.addGestureRecognizer(tapGesture)
        
        self.mainView!.addGestureRecognizer(UIScreenEdgePanGestureRecognizer(target: self, action: #selector(RC_DrawerController.panGestureHandler(_:)))  )
        self.mainView!.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(RC_DrawerController.panGestureHandler(_:)))  )
       
    }

    required public init?(coder aDecoder: NSCoder){
        super.init()
    }
    
    public func openDrawer(_ direction: RC_Gravity){
        // Open drawer opened in given direction
        
        self.direction = direction
        
        if self.leadingConstraint!.constant == CGFloat(0.0) {
            closeDrawer(direction)
            return
        }
        
        if direction == RC_Gravity.START {
            self.leadingConstraint!.constant = 0.0 - (self.drawerView?.frame.width)! - 20.0
        }else {
            self.leadingConstraint!.constant = (self.drawerView?.frame.width)! + 20.0
        }

        if let handler = self.drawerChangeHandler {
            handler.onDrawerStateChanged?(2)  // RC_DrawerController.DrawerState.STATE_IDEL
            handler.onDrawerSlide?(self.drawerView, Float(0.1))
        }

        UIView.animate(withDuration: 5.0, delay: 0, options: .curveEaseIn,
                animations: {() -> Void in
                    self.drawerVisible = true
                    if direction == RC_Gravity.START {
                        self.leadingConstraint!.constant = 0
                    } else {
                        self.leadingConstraint!.constant = self.mainView!.frame.width - self.drawerView!.frame.width
                    }
                    
                },
                completion: {(finished : Bool) -> Void in
                    
                    self.mainView?.setNeedsDisplay()
                    self.drawerOpen = true
                    
                    if let handler = self.drawerChangeHandler {
                        handler.onDrawerSlide?(self.drawerView, Float(1.0))
                        handler.onDrawerOpened?(self.drawerView)
                        handler.onDrawerStateChanged?(0)  // RC_DrawerController.DrawerState.STATE_IDEL
                    }
                    
                })
    }
    
    public func closeDrawer(_ direction: RC_Gravity){
        // Close drawer opened in given direction

        if let handler = self.drawerChangeHandler {
            handler.onDrawerStateChanged?(2)  // RC_DrawerController.DrawerState.STATE_IDEL
            handler.onDrawerSlide?(self.drawerView, Float(1.0))
        }

        UIView.animate(withDuration: 5.0, delay: 0, usingSpringWithDamping: 0.25, initialSpringVelocity: 0, options: .curveEaseIn,
                animations: {() -> Void in
                    if self.direction == RC_Gravity.START {
                        self.leadingConstraint!.constant = 0.0 - (self.drawerView?.frame.width)! - 20.0
                    }else {
                        self.leadingConstraint!.constant = (self.mainView?.frame.width)! + 20.0
                    }

                }, completion: { (finished : Bool) -> Void in
                    
                    self.mainView?.setNeedsDisplay()
                    self.drawerOpen = false
                    self.drawerVisible = false
                    
                    if let handler = self.drawerChangeHandler {
                        handler.onDrawerSlide?(self.drawerView, Float(0.0))
                        handler.onDrawerClosed?(self.drawerView)
                        handler.onDrawerStateChanged?(0)  // RC_DrawerController.DrawerState.STATE_IDEL
                    }
                })

    }
    
    
    public func closeDrawers(){
        // Close the drawer opened from any side
        closeDrawer(self.direction)
    }
    
    
    @objc private func panGestureHandler(_ sender: UIPanGestureRecognizer){
        let delta = CGFloat(sender.location(in: mainView).x)
        
        if sender.state == UIGestureRecognizer.State.began {
            if let handler = self.drawerChangeHandler {
                handler.onDrawerStateChanged?(1)   // RC_DrawerController.DrawerState.STATE_DRAGGING
            }
        }
        
        if let handler = self.drawerChangeHandler {
            if delta <= self.drawerView!.frame.width {
                handler.onDrawerSlide?(self.drawerView, Float(delta / self.drawerView!.frame.width) )
            }
        }
        
        if self.direction == RC_Gravity.START {
            
            if delta <= self.drawerView!.frame.width {
                
                self.leadingConstraint?.constant = delta - self.drawerView!.frame.width
                self.drawerVisible = true
            }
        
            if sender.state == UIGestureRecognizer.State.ended {
                
                if let handler = self.drawerChangeHandler {
                     handler.onDrawerStateChanged?(2)  // RC_DrawerController.DrawerState.STATE_SETTLINE
                 }
                 
                if delta <= ( self.drawerView!.frame.width / 2) {
                    
                    // Close drawer completely
                    UIView.animate(withDuration: 5.0, delay: 0, options: .curveEaseIn, animations: { () -> Void in
                        self.leadingConstraint?.constant = 0 - self.drawerView!.frame.width - 20
                    }, completion: { (finished : Bool) -> Void in
                        
                        self.mainView?.setNeedsDisplay()
                        self.drawerVisible = false
                        self.drawerOpen = false
                        
                        if let handler = self.drawerChangeHandler {
                            handler.onDrawerClosed?(self.drawerView!)
                            handler.onDrawerStateChanged?(0)  // RC_DrawerController.DrawerState.STATE_IDEL
                        }
                    })
                    
                } else if delta <= ( self.drawerView!.frame.width + 50) {
                    
                    // Open drawer completely
                    self.drawerVisible = true
                    
                    UIView.animate(withDuration: 5.0, delay: 0, options: .curveEaseIn, animations: { () -> Void in
                        self.leadingConstraint?.constant = 0
                    }, completion: {(finished : Bool) -> Void in
                        self.mainView?.setNeedsDisplay()
                        self.drawerOpen = true
                        
                        if let handler = self.drawerChangeHandler {
                            handler.onDrawerOpened?(self.drawerView)
                            handler.onDrawerStateChanged?(0)  // RC_DrawerController.DrawerState.STATE_IDEL
                        }
                        
                    })
                    
                }
                
            }  // if sender.state == UIGestureRecognizer.State.ended
            
        } else {
            if delta >= self.mainView!.frame.width - self.drawerView!.frame.width {
                self.leadingConstraint?.constant = delta
                self.drawerVisible = true
                
                if let handler = self.drawerChangeHandler {
                    handler.onDrawerStateChanged?(1)  // RC_DrawerController.DrawerState.STATE_DRAGGING
                }

            }

            if sender.state == UIGestureRecognizer.State.ended {
 
                if let handler = self.drawerChangeHandler {
                    handler.onDrawerStateChanged?(2)  // RC_DrawerController.DrawerState.STATE_SETTLINE
                }
                
                if delta >= self.mainView!.frame.width - (self.drawerView!.frame.width / 2) {
                    // Close drawer completely
                    UIView.animate(withDuration: 5.0, delay: 0, options: .curveEaseIn, animations: { () -> Void in
                        self.leadingConstraint?.constant = self.mainView!.frame.width + 20
                    }, completion: { (finished : Bool) -> Void in
                        self.mainView?.setNeedsDisplay()
                        self.drawerVisible = false
                        self.drawerOpen = false
                        
                        if let handler = self.drawerChangeHandler {
                            handler.onDrawerClosed?(self.drawerView!)
                            handler.onDrawerStateChanged?(0)  // RC_DrawerController.DrawerState.STATE_IDEL
                        }
                    })
                    
                } else if delta >= ( self.mainView!.frame.width - self.drawerView!.frame.width - 50) {
                    
                    // Open drawer completely
                    self.drawerVisible = true

                    UIView.animate(withDuration: 5.0, delay: 0, options: .curveEaseIn, animations: { () -> Void in
                        self.leadingConstraint?.constant = self.mainView!.frame.width - self.drawerView!.frame.width
                    }, completion: {(finished : Bool) -> Void in
                        self.mainView?.setNeedsDisplay()
                        self.drawerOpen = true
                        
                        if let handler = self.drawerChangeHandler {
                            handler.onDrawerOpened?(self.drawerView!)
                            handler.onDrawerStateChanged?(0)  // RC_DrawerController.DrawerState.STATE_IDEL
                        }
                        
                    })
                    
                }
                
            }  // if sender.state == UIGestureRecognizer.State.ended
            
        }
    }
    
    @objc private func tapGestureHandler( _ sender: UIGestureRecognizer){
        self.closeDrawers()
    }
    
}
