//
//  extension UIView.swift
//  ChessApp
//
//  Created by Student 3 on 11/4/18.
//  Copyright © 2018 Student 3. All rights reserved.
//

import UIKit

extension UIView{
    
    /*
     Enabling each board tile (BoardSpace) to recognize tap gesture from user,
     we implement this public func from https://medium.com/@sdrzn/adding-tap-gesture
     */
    
    // In order to create computed properties for this UIVIew, we need a key to store
    // and access stored properties
    fileprivate struct AssociatedObjectKeys{
        static var tapGestureRecognizer = "MediaViewerAssociatedObjectKey_mediaViewer"
    }
    
    fileprivate typealias Action = (()-> Void)?
    
    // Set our computed property type to a closure
    fileprivate var tapGestureRecognizerAction :Action? {
        set {
            if let newValue = newValue{
                // Computed properties get stored in associated Object
                objc_setAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            }
        }
        
        get {
            let tapGestureRecognizerActionInstance = objc_getAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer) as? Action
            return tapGestureRecognizerActionInstance
        }
    }
    
    public func addTapGestureRecognizer(action: (() -> Void)?){
        self.isUserInteractionEnabled = true
        self.tapGestureRecognizerAction = action
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action: #selector(handleTapGesture))
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    // Everytime the user taps on the UIView or UIView subclass the function get called
    // which triggers the closure we stored
    @objc fileprivate func handleTapGesture(sender: UITapGestureRecognizer){
        if let action = self.tapGestureRecognizerAction{
            action?()
        }else{
            print("no action")
        }
    }
    
}
