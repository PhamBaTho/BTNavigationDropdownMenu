//
//  UIView+Extension.swift
//
//  Copyright (c) 2017 PHAM BA THO (phambatho@gmail.com). All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import UIKit

internal extension UIView {
    struct Static {
        static var key = "key"
    }
    var viewIdentifier: String? {
        get {
            return objc_getAssociatedObject( self, &Static.key ) as? String
        }
        set {
            objc_setAssociatedObject(self, &Static.key, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    func x() -> CGFloat {
        return self.frame.origin.x
    }
    
    func setX(x:CGFloat) {
        self.frame = CGRect(x:x, y:self.y(), width:self.width(), height:self.height())
    }
    
    func y() -> CGFloat {
        return self.frame.origin.y
    }
    
    func setY(y:CGFloat) {
        self.frame = CGRect(x:self.x(), y:y, width:self.width(), height:self.height())
    }
    
    func width() -> CGFloat {
        return self.frame.width
    }
    
    func setWidth(width:CGFloat) {
        self.frame = CGRect(x:self.x(), y:self.y(), width:width, height:self.height())
    }
    
    func height() -> CGFloat{
        return self.frame.height
    }
    
    func setHeight(height:CGFloat) {
        self.frame = CGRect(x:self.x(), y:self.y(), width:self.width(), height:height)
        
    }
    
    func size() -> CGSize {
        return self.frame.size
    }
    
    func setSize(size: CGSize) {
        self.frame = CGRect(x:self.x(), y:self.y(), width:size.width, height:size.height)
    }
    
    func origin() -> CGPoint {
        return self.frame.origin
    }
    
    func setOrigin(origin: CGPoint) {
        self.frame = CGRect(x:origin.x, y:origin.y, width:self.width(), height:self.height())
    }
}
