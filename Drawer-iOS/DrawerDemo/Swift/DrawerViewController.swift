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


public class DrawerViewController : UIViewController , RC_DrawerChangeHandler {

    @IBOutlet weak var nav_view_LeadingConstraint: NSLayoutConstraint!
    var previousMenuitem: UIButton? // RC Note : Used to unselect the previous menu item
    @IBOutlet weak var drawer_layoutOutlet: UIView!
    @IBOutlet weak var content_frameOutlet: UIView!
    @IBOutlet weak var toolbarOutlet: UINavigationController!
    @IBOutlet weak var textViewOutlet: UILabel!
    @IBOutlet weak var tvEventLogOutlet: UILabel!
    @IBOutlet weak var tvLogOutlet: UILabel!
    @IBOutlet weak var nav_viewOutlet: UIView!
    @IBOutlet weak var drawerImageOutlet: UIImageView!
    @IBOutlet weak var drawerBtnOutlet: UIButton!
    @IBOutlet weak var nav_cameraOutlet: UIButton!
    @IBOutlet weak var nav_galleryOutlet: UIButton!
    @IBOutlet weak var nav_slideshowOutlet: UIButton!
    @IBOutlet weak var nav_manageOutlet: UIButton!

    open func onDrawerSlide(_ drawerView: UIView?, _ slideOffset: Float) -> Void {
        print("RC : onDrawerSlide() called, slideOffset = \(slideOffset)")
        tvLog!.text = "onDrawerSlide() called"
    }

    open func onDrawerOpened(_ drawerView: UIView?) -> Void {
        print("RC : onDrawerOpened() called")
        print("RC : isDrawerOpen() = \(mDrawerLayout?.isDrawerOpen(RC_Gravity.START))")
        print("RC : isDrawerOpen() = \(mDrawerLayout?.isDrawerVisible(RC_Gravity.START))")
        tvLog!.text = "onDrawerOpened() called"
    }

    open func onDrawerClosed(_ drawerView: UIView?) -> Void {
        print("RC : onDrawerClosed() called")
        print("RC : isDrawerOpen() = \(mDrawerLayout?.isDrawerOpen(RC_Gravity.START))")
        print("RC : isDrawerOpen() = \(mDrawerLayout?.isDrawerVisible(RC_Gravity.START))")
        tvLog!.text = "onDrawerClosed() called"
    }

    open func onDrawerStateChanged(_ newState: Int) -> Void {
        print("RC : onDrawerStateChanged() called \(newState)")
        print("RC : isDrawerOpen() = \(mDrawerLayout?.isDrawerOpen(RC_Gravity.START))")
        print("RC : isDrawerOpen() = \(mDrawerLayout?.isDrawerVisible(RC_Gravity.START))")
        tvLog!.text = "onDrawerStateChanged() called"
    }


    @IBAction func onNavigationItemSelected(_ menuItem: UIButton?){
        // Set item as selected to persist highlight
        previousMenuitem?.isSelected = false
		previousMenuitem = menuItem
		menuItem?.isSelected = true 

        // Add code here to update the UI based on the item selected for example, swap UI fragments here
        switch (menuItem!.tag){

        case R.id.nav_camera:
            print("RC : Camera menu clicked")
            tvLog!.text = "Camera menu clicked"
            var cam_intent: [String:Any] = [:]
            var cam_intent_VC = UIStoryboard(name: "camera_activity", bundle: nil).instantiateViewController(withIdentifier: "CameraViewController") as! CameraViewController
            self.navigationController?.pushViewController(cam_intent_VC, animated: true)

        case R.id.nav_gallery:
            print("RC : Gallery menu clicked")
            tvLog!.text = "Gallery menu clicked"

        case R.id.nav_manage:
            print("RC : Manage menu clicked")
            tvLog!.text = "Manage menu clicked"

        case R.id.nav_slideshow:
            print("RC : Slideshow menu clicked")
            tvLog!.text = "Slideshow menu clicked"

        case R.id.drawerImage:
            print("RC : Drawer Image clicked")
            tvLog!.text = "Drawer Image clicked"

        case R.id.drawerBtn:
            // Android : Not working, onClick event is not fired for Drawer Header controls
            print("RC : Drawer menu clicked")
            tvLog!.text = "Drawer menu clicked"

        default:
            // ToDo : provide the default case
            print("Error : Error - Default case not provided")
        }

    }


    @IBAction func onNavButtonClick(_ sender: UIBarButtonItem) {
        var dummyButton = UIButton()
        dummyButton.tag = sender.tag
        dummyButton.titleLabel?.text = sender.title
        onOptionsItemSelected(dummyButton)
    }

    open func onOptionsItemSelected(_ item: UIButton?) -> Bool{
        switch (item!.tag){

        case 9191910001 : // android.R.id.home
            print("RC : onOptionsItemSelected() called")
            tvLog!.text = "onOptionsItemSelected() called"
            mDrawerLayout?.openDrawer(RC_Gravity.START)
            return true

        default:
            // ToDo : provide the default case
            print("Error : Error - Default case not provided")
        }
        return true
    }


    private var mDrawerLayout: RC_DrawerController? = nil
    private var tvLog: UILabel? = UILabel()

    // Note - source android method is onCreate()
    // RC Note : Any code refering to UI should be moved to viewDidAppear()
    override public func viewDidLoad(){
        super.viewDidLoad()

        var toolbar: UINavigationController? = toolbarOutlet
        tvLog = tvLogOutlet

        var actionbar: UINavigationController? = self.navigationController
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: nil, style: .plain, target: nil, action: nil)
        self.navigationItem.leftBarButtonItem?.image = UIImage(named: "burger_menu_24")
        self.navigationItem.leftBarButtonItem?.tag = 9191910001
        self.navigationItem.leftBarButtonItem?.target = self
        self.navigationItem.leftBarButtonItem?.action = #selector(self.onNavButtonClick(_:))

        mDrawerLayout = RC_DrawerController(drawerView: self.nav_viewOutlet, mainView: self.view, leadingConstraint: self.nav_view_LeadingConstraint, drawerChangeHandler: self)
		var navigationView: UIView? = nav_viewOutlet
	}

}
