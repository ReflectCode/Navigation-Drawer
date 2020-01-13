//
//  RC_VectorStore.swift
//  Project : DrawerDemo
//
//  Created by ReflectCode.com
//  Class for storing the vector images defined for the project
//  This code is auto generated from vector xml files defined in 'res\drawable' folder

// The MIT License (MIT)
//
// Copyright (c) 2020 Reflect Code Technologies (OPC) Pvt. Ltd. (http://ReflectCode.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software
// and associated documentation files (the "Software"), to deal in the Software without restriction,
// including without limitation the rights to use, copy, modify, merge, publish, distribute,
// sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all copies or
// substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
// BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
// DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

 
import UIKit

class RC_VectorStore{
 
    /* Usage guide : 
         let vectorBack = RC_VectorStore.defaultVector(viewBound: testImageView.bounds)
         let vectorBack.strokeColor = UIColor.blue.cgColor
         testImageView.layer.addSublayer(vectorBack)
    */
 
    // Sample vector image. Can be used as a place holder
 
    static var defaultVector_L1 = CAShapeLayer()  // Static variable referring to subLayers
    static var defaultVector_L2 = CAShapeLayer()  // These variables are initialized in defaultVector()
 
    class func defaultVector(viewBounds: CGRect) -> CAShapeLayer{
 
        // Square path
        let shPath1 = UIBezierPath()
        shPath1.move(to: CGPoint(x: 0, y: 0))
        shPath1.addLine(to: CGPoint(x: 24, y: 0))
        shPath1.addLine(to: CGPoint(x: 24, y: 24))
        shPath1.addLine(to: CGPoint(x: 0, y: 24))
        shPath1.addLine(to: CGPoint(x: 0, y: 0))
        shPath1.close()
 
        // android:name = "L1" 
        defaultVector_L1.masksToBounds = true
        defaultVector_L1.fillColor = UIColor.clear.cgColor           // Default is black
        defaultVector_L1.opacity = 1
        defaultVector_L1.frame = shPath1.bounds
        defaultVector_L1.path = shPath1.cgPath
 
 
        // Circle and exclemation path
        let shPath2 = UIBezierPath()
 
        shPath2.move(to: CGPoint(x: 11, y: 15))
        shPath2.addLine(to: CGPoint(x: 13, y: 15))
        shPath2.addLine(to: CGPoint(x: 13, y: 17))
        shPath2.addLine(to: CGPoint(x: 11, y: 17))
        shPath2.close()
 
        shPath2.move(to: CGPoint(x: 11, y: 7))
        shPath2.addLine(to: CGPoint(x: 13, y: 7))
        shPath2.addLine(to: CGPoint(x: 13, y: 13))
        shPath2.addLine(to: CGPoint(x: 11, y: 13))
        shPath2.close()
 
        // Outer circle
        shPath2.move(to: CGPoint(x: 11.99, y: 2))
        shPath2.addCurve(to: CGPoint(x: 2, y: 12), controlPoint1: CGPoint(x: 6.47, y: 2), controlPoint2: CGPoint(x: 2, y: 6.48))
        shPath2.addCurve(to: CGPoint(x: 11.99, y: 22), controlPoint1: CGPoint(x: 2, y: 18), controlPoint2: CGPoint(x: 6.47, y: 22))
        shPath2.addCurve(to: CGPoint(x: 22, y: 12), controlPoint1: CGPoint(x: 17.52, y: 22), controlPoint2: CGPoint(x: 22, y: 17.52))
        shPath2.addCurve(to: CGPoint(x: 11.99, y: 2), controlPoint1: CGPoint(x: 22, y: 6), controlPoint2: CGPoint(x: 17.52, y: 2))
        shPath2.close()
 
        // Inner Circle
        shPath2.move(to: CGPoint(x: 12, y: 20))
        shPath2.addCurve(to: CGPoint(x: 4, y: 12), controlPoint1: CGPoint(x: 7.58, y: 20), controlPoint2: CGPoint(x: 4, y: 16.42))
        shPath2.addCurve(to: CGPoint(x: 12, y: 4), controlPoint1: CGPoint(x: 4, y: 8), controlPoint2: CGPoint(x: 7.58, y: 4))
        shPath2.addCurve(to: CGPoint(x: 20, y: 12), controlPoint1: CGPoint(x: 16, y: 4), controlPoint2: CGPoint(x: 20, y: 7.58))
        shPath2.addCurve(to: CGPoint(x: 12, y: 20), controlPoint1: CGPoint(x: 20, y: 16), controlPoint2: CGPoint(x: 16.24, y: 20))
        shPath2.close()
 
        // android:name = "L2" 
        defaultVector_L2.masksToBounds = true
        defaultVector_L2.opacity = 1
        defaultVector_L2.bounds = shPath2.bounds
        defaultVector_L2.frame = shPath2.bounds
        defaultVector_L2.path = shPath2.cgPath
        defaultVector_L1.addSublayer(defaultVector_L2)
 
 
        // Resize the Root Shape layer to parent size
        let parentMinSide = min(viewBounds.width , viewBounds.height)
        let shapeLayerMinSize = max(defaultVector_L1.bounds.size.width, defaultVector_L1.bounds.size.height)
        let factor = parentMinSide / shapeLayerMinSize
 
        let fillAspectTransform = CGAffineTransform(scaleX: factor, y: factor)
        defaultVector_L1.setAffineTransform(fillAspectTransform)
        defaultVector_L1.frame = viewBounds
 
        return defaultVector_L1
        
    }
 
 
// Swift code for vector image defined in 'burger_menu_24.xml' File 
 

    class func burger_menu_24(viewBounds: CGRect) -> CAShapeLayer{
        let burger_menu_24_vect1 = CAShapeLayer()
        let vectorBounds = CGRect(x: 0, y: 0, width: 24.0, height: 24.0)
        burger_menu_24_vect1.masksToBounds = true
        burger_menu_24_vect1.fillColor = UIColor.clear.cgColor
        burger_menu_24_vect1.bounds = vectorBounds
        burger_menu_24_vect1.opacity = 1
        burger_menu_24_vect1.setAffineTransform(CGAffineTransform(scaleX: viewBounds.width / 24.0, y: viewBounds.height / 24.0))
        burger_menu_24_vect1.frame = viewBounds

        let path1_path = UIBezierPath()

        path1_path.move(to: CGPoint(x: 2, y: 15.5))
        path1_path.addLine(to: CGPoint(x: 2, y: 17.5))
        path1_path.addLine(to: CGPoint(x: 22, y: 17.5))
        path1_path.addLine(to: CGPoint(x: 22, y: 15.5))
        path1_path.addLine(to: CGPoint(x: 2, y: 15.5))
        path1_path.close()

        path1_path.move(to: CGPoint(x: 2, y: 10.5))
        path1_path.addLine(to: CGPoint(x: 2, y: 12.5))
        path1_path.addLine(to: CGPoint(x: 22, y: 12.5))
        path1_path.addLine(to: CGPoint(x: 22, y: 10.5))
        path1_path.addLine(to: CGPoint(x: 2, y: 10.5))
        path1_path.close()

        path1_path.move(to: CGPoint(x: 2, y: 5.5))
        path1_path.addLine(to: CGPoint(x: 2, y: 7.5))
        path1_path.addLine(to: CGPoint(x: 22, y: 7.5))
        path1_path.addLine(to: CGPoint(x: 22, y: 5.5))
        path1_path.addLine(to: CGPoint(x: 2, y: 5.5))
        path1_path.close()

        let path1_layer = CAShapeLayer()
        path1_layer.frame = viewBounds
        path1_layer.path = path1_path.cgPath
        path1_layer.opacity = 1
        path1_layer.fillColor = UIColor(named: "colorBlack")?.cgColor
        burger_menu_24_vect1.addSublayer(path1_layer)
  
        // burger_menu_24_vect1.rasterizationScale = UIScreen.main.scale
        // burger_menu_24_vect1.shouldRasterize = true    // ToDo : Check if this improves performance
        return burger_menu_24_vect1
    }
 
// Swift code for vector image defined in 'camera.xml' File 
 

    class func camera(viewBounds: CGRect) -> CAShapeLayer{
        let camera_vect1 = CAShapeLayer()
        let vectorBounds = CGRect(x: 0, y: 0, width: 24.0, height: 24.0)
        camera_vect1.masksToBounds = true
        camera_vect1.fillColor = UIColor.clear.cgColor
        camera_vect1.bounds = vectorBounds
        camera_vect1.opacity = 1
        camera_vect1.setAffineTransform(CGAffineTransform(scaleX: viewBounds.width / 24.0, y: viewBounds.height / 24.0))
        camera_vect1.frame = viewBounds

        let path1_path = UIBezierPath()

        path1_path.move(to: CGPoint(x: 12, y: 12))
        path1_path.move(to: CGPoint(x: 8.8, y: 12))
        path1_path.addCurve(to: CGPoint(x: 15.2, y: 12), controlPoint1: CGPoint(x: 8.8, y: 16.32), controlPoint2: CGPoint(x: 15.2, y: 16.32))
        path1_path.addCurve(to: CGPoint(x: 8.8, y: 12), controlPoint1: CGPoint(x: 15.2, y: 16.32), controlPoint2: CGPoint(x: 8.8, y: 16.32))
        let path1_layer = CAShapeLayer()
        path1_layer.frame = viewBounds
        path1_layer.path = path1_path.cgPath
        path1_layer.opacity = 1
        path1_layer.fillColor = UIColor(named: "colorBlack")?.cgColor
        camera_vect1.addSublayer(path1_layer)

        let path2_path = UIBezierPath()

        path2_path.move(to: CGPoint(x: 9, y: 2))
        path2_path.addLine(to: CGPoint(x: 7.17, y: 4))
        path2_path.addLine(to: CGPoint(x: 4, y: 4))
        path2_path.addCurve(to: CGPoint(x: 2, y: 6), controlPoint1: CGPoint(x: 2.9, y: 4), controlPoint2: CGPoint(x: 2, y: 4.9))
        path2_path.addLine(to: CGPoint(x: 2, y: 18))
        path2_path.addCurve(to: CGPoint(x: 4, y: 20), controlPoint1: CGPoint(x: 2, y: 19.1), controlPoint2: CGPoint(x: 2.9, y: 20))
        path2_path.addLine(to: CGPoint(x: 20, y: 20))
        path2_path.addCurve(to: CGPoint(x: 22, y: 18), controlPoint1: CGPoint(x: 21.1, y: 20), controlPoint2: CGPoint(x: 22, y: 19.1))
        path2_path.addLine(to: CGPoint(x: 22, y: 6))
        path2_path.addCurve(to: CGPoint(x: 20, y: 4), controlPoint1: CGPoint(x: 22, y: 4.9), controlPoint2: CGPoint(x: 21.1, y: 4))
        path2_path.addLine(to: CGPoint(x: 16.83, y: 4))
        path2_path.addLine(to: CGPoint(x: 15, y: 2))
        path2_path.addLine(to: CGPoint(x: 9, y: 2))
        path2_path.close()

        path2_path.move(to: CGPoint(x: 12, y: 17))
        path2_path.addCurve(to: CGPoint(x: 7, y: 12), controlPoint1: CGPoint(x: 9.24, y: 17), controlPoint2: CGPoint(x: 7, y: 14.76))
        path2_path.addCurve(to: CGPoint(x: 12, y: 7), controlPoint1: CGPoint(x: 7, y: 9), controlPoint2: CGPoint(x: 9.24, y: 7))
        path2_path.addCurve(to: CGPoint(x: 17, y: 12), controlPoint1: CGPoint(x: 15, y: 7), controlPoint2: CGPoint(x: 17, y: 9.24))
        path2_path.addCurve(to: CGPoint(x: 12, y: 17), controlPoint1: CGPoint(x: 17, y: 15), controlPoint2: CGPoint(x: 14.76, y: 17))
        path2_path.close()

        let path2_layer = CAShapeLayer()
        path2_layer.frame = viewBounds
        path2_layer.path = path2_path.cgPath
        path2_layer.opacity = 1
        path2_layer.fillColor = UIColor(named: "colorBlack")?.cgColor
        camera_vect1.addSublayer(path2_layer)
  
        // camera_vect1.rasterizationScale = UIScreen.main.scale
        // camera_vect1.shouldRasterize = true    // ToDo : Check if this improves performance
        return camera_vect1
    }
 
// Swift code for vector image defined in 'gallery.xml' File 
 

    class func gallery(viewBounds: CGRect) -> CAShapeLayer{
        let gallery_vect1 = CAShapeLayer()
        let vectorBounds = CGRect(x: 0, y: 0, width: 24.0, height: 24.0)
        gallery_vect1.masksToBounds = true
        gallery_vect1.fillColor = UIColor.clear.cgColor
        gallery_vect1.bounds = vectorBounds
        gallery_vect1.opacity = 1
        gallery_vect1.setAffineTransform(CGAffineTransform(scaleX: viewBounds.width / 24.0, y: viewBounds.height / 24.0))
        gallery_vect1.frame = viewBounds

        let path1_path = UIBezierPath()

        path1_path.move(to: CGPoint(x: 21, y: 19))
        path1_path.addLine(to: CGPoint(x: 21, y: 5))
        path1_path.addCurve(to: CGPoint(x: 19, y: 3), controlPoint1: CGPoint(x: 21, y: 3.9), controlPoint2: CGPoint(x: 20.1, y: 3))
        path1_path.addLine(to: CGPoint(x: 5, y: 3))
        path1_path.addCurve(to: CGPoint(x: 3, y: 5), controlPoint1: CGPoint(x: 3.9, y: 3), controlPoint2: CGPoint(x: 3, y: 3.9))
        path1_path.addLine(to: CGPoint(x: 3, y: 19))
        path1_path.addCurve(to: CGPoint(x: 5, y: 21), controlPoint1: CGPoint(x: 3, y: 20.1), controlPoint2: CGPoint(x: 3.9, y: 21))
        path1_path.addLine(to: CGPoint(x: 19, y: 21))
        path1_path.addCurve(to: CGPoint(x: 21, y: 19), controlPoint1: CGPoint(x: 20.1, y: 21), controlPoint2: CGPoint(x: 21, y: 20.1))
        path1_path.close()

        path1_path.move(to: CGPoint(x: 8.5, y: 13.5))
        path1_path.addLine(to: CGPoint(x: 11, y: 16.51))
        path1_path.addLine(to: CGPoint(x: 14.5, y: 12))
        path1_path.addLine(to: CGPoint(x: 19, y: 18))
        path1_path.addLine(to: CGPoint(x: 5, y: 18))
        path1_path.addLine(to: CGPoint(x: 8.5, y: 13.5))
        path1_path.close()

        let path1_layer = CAShapeLayer()
        path1_layer.frame = viewBounds
        path1_layer.path = path1_path.cgPath
        path1_layer.opacity = 1
        path1_layer.fillColor = UIColor(named: "colorBlack")?.cgColor
        gallery_vect1.addSublayer(path1_layer)
  
        // gallery_vect1.rasterizationScale = UIScreen.main.scale
        // gallery_vect1.shouldRasterize = true    // ToDo : Check if this improves performance
        return gallery_vect1
    }
 
// Swift code for vector image defined in 'manage.xml' File 
 

    class func manage(viewBounds: CGRect) -> CAShapeLayer{
        let manage_vect1 = CAShapeLayer()
        let vectorBounds = CGRect(x: 0, y: 0, width: 24.0, height: 24.0)
        manage_vect1.masksToBounds = true
        manage_vect1.fillColor = UIColor.clear.cgColor
        manage_vect1.bounds = vectorBounds
        manage_vect1.opacity = 1
        manage_vect1.setAffineTransform(CGAffineTransform(scaleX: viewBounds.width / 24.0, y: viewBounds.height / 24.0))
        manage_vect1.frame = viewBounds

        let path1_path = UIBezierPath()

        path1_path.move(to: CGPoint(x: 14, y: 10))
        path1_path.addLine(to: CGPoint(x: 2, y: 10))
        path1_path.addLine(to: CGPoint(x: 2, y: 12))
        path1_path.addLine(to: CGPoint(x: 14, y: 12))
        path1_path.addLine(to: CGPoint(x: 14, y: 10))
        path1_path.close()

        path1_path.move(to: CGPoint(x: 14, y: 6))
        path1_path.addLine(to: CGPoint(x: 2, y: 6))
        path1_path.addLine(to: CGPoint(x: 2, y: 8))
        path1_path.addLine(to: CGPoint(x: 14, y: 8))
        path1_path.addLine(to: CGPoint(x: 14, y: 6))
        path1_path.close()

        path1_path.move(to: CGPoint(x: 2, y: 16))
        path1_path.addLine(to: CGPoint(x: 10, y: 16))
        path1_path.addLine(to: CGPoint(x: 10, y: 14))
        path1_path.addLine(to: CGPoint(x: 2, y: 14))
        path1_path.addLine(to: CGPoint(x: 2, y: 16))
        path1_path.close()

        path1_path.move(to: CGPoint(x: 21.5, y: 11.5))
        path1_path.addLine(to: CGPoint(x: 23, y: 13))
        path1_path.addLine(to: CGPoint(x: 16.01, y: 20))
        path1_path.addLine(to: CGPoint(x: 11.5, y: 15.5))
        path1_path.addLine(to: CGPoint(x: 13, y: 14))
        path1_path.addLine(to: CGPoint(x: 16.01, y: 17))
        path1_path.addLine(to: CGPoint(x: 21.5, y: 11.5))
        path1_path.close()

        let path1_layer = CAShapeLayer()
        path1_layer.frame = viewBounds
        path1_layer.path = path1_path.cgPath
        path1_layer.opacity = 1
        path1_layer.fillColor = UIColor(named: "colorBlack")?.cgColor
        manage_vect1.addSublayer(path1_layer)
  
        // manage_vect1.rasterizationScale = UIScreen.main.scale
        // manage_vect1.shouldRasterize = true    // ToDo : Check if this improves performance
        return manage_vect1
    }
 
// Swift code for vector image defined in 'slideshow.xml' File 
 

    class func slideshow(viewBounds: CGRect) -> CAShapeLayer{
        let slideshow_vect1 = CAShapeLayer()
        let vectorBounds = CGRect(x: 0, y: 0, width: 24.0, height: 24.0)
        slideshow_vect1.masksToBounds = true
        slideshow_vect1.fillColor = UIColor.clear.cgColor
        slideshow_vect1.bounds = vectorBounds
        slideshow_vect1.opacity = 1
        slideshow_vect1.setAffineTransform(CGAffineTransform(scaleX: viewBounds.width / 24.0, y: viewBounds.height / 24.0))
        slideshow_vect1.frame = viewBounds

        let path1_path = UIBezierPath()

        path1_path.move(to: CGPoint(x: 10, y: 8))
        path1_path.addLine(to: CGPoint(x: 10, y: 16))
        path1_path.addLine(to: CGPoint(x: 15, y: 12))
        path1_path.addLine(to: CGPoint(x: 10, y: 8))
        path1_path.close()

        path1_path.move(to: CGPoint(x: 19, y: 3))
        path1_path.addLine(to: CGPoint(x: 5, y: 3))
        path1_path.addCurve(to: CGPoint(x: 3, y: 5), controlPoint1: CGPoint(x: 3.9, y: 3), controlPoint2: CGPoint(x: 3, y: 3.9))
        path1_path.addLine(to: CGPoint(x: 3, y: 19))
        path1_path.addCurve(to: CGPoint(x: 5, y: 21), controlPoint1: CGPoint(x: 3, y: 20.1), controlPoint2: CGPoint(x: 3.9, y: 21))
        path1_path.addLine(to: CGPoint(x: 19, y: 21))
        path1_path.addCurve(to: CGPoint(x: 21, y: 19), controlPoint1: CGPoint(x: 20.1, y: 21), controlPoint2: CGPoint(x: 21, y: 20.1))
        path1_path.addLine(to: CGPoint(x: 21, y: 5))
        path1_path.addCurve(to: CGPoint(x: 19, y: 3), controlPoint1: CGPoint(x: 21, y: 3.9), controlPoint2: CGPoint(x: 20.1, y: 3))
        path1_path.close()

        path1_path.move(to: CGPoint(x: 19, y: 19))
        path1_path.addLine(to: CGPoint(x: 5, y: 19))
        path1_path.addLine(to: CGPoint(x: 5, y: 5))
        path1_path.addLine(to: CGPoint(x: 19, y: 5))
        path1_path.addLine(to: CGPoint(x: 19, y: 19))
        path1_path.close()

        let path1_layer = CAShapeLayer()
        path1_layer.frame = viewBounds
        path1_layer.path = path1_path.cgPath
        path1_layer.opacity = 1
        path1_layer.fillColor = UIColor(named: "colorBlack")?.cgColor
        slideshow_vect1.addSublayer(path1_layer)
  
        // slideshow_vect1.rasterizationScale = UIScreen.main.scale
        // slideshow_vect1.shouldRasterize = true    // ToDo : Check if this improves performance
        return slideshow_vect1
    }
}
