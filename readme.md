<h1 align="center">
  <a href="http://www.reflectcode.com">
    ReflectCode
  </a>
</h1>
<p align="center">
  <strong>Automated Source Code Transformation service</strong><br>
  <strong>Re-cycle / Re-use / Re-purpose</strong><br>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Platform-Android%20%7C%20iOS-green" alt="Platform - Android | iOS" />
  <a href="https://twitter.com/intent/follow?screen_name=reflectcode">
    <img src="https://img.shields.io/twitter/follow/reflectcode.svg?label=Follow%20@reflectcode" alt="Follow @reflectcode" />
  </a>
</p>


-----
# Drawer Navigation Demo
This project demonstrates the conversion of DrawerLayout widget. 

This repository contains the Android source code which was used as input and generated iOS source code project.
 
| Class | Package |
|---------|------------|
| DrawerLayout | android.support.v4.widget.DrawerLayout | 
| GravityCompat | android.support.v4.view.GravityCompat | 
| NavigationView | android.support.design.widget.NavigationView| 
| MenuItem | android.view.MenuItem | 



## Statement Estimation
Check out project report - DrawerDemo_RC-Report.pdf


## Dev Notes

* **DrawerLayout** - For porting the DrawerLayout the custom control is developed 'RC_DrawerController.swift'.
This control is Swift port of android DrawerLayout and provides all methods and events such as Open, Close, StareChange and Drag

Credits for Android project - http://www.androidauthority.com/how-to-build-an-image-gallery-app-718976/

## Screen shots

<img src="/Visuals/DrawerLayout_Side-By-Side.gif" alt="DrawerLayout Video"/>

-----

<img src="/Visuals/DrawerLayout_Screen_Shot_P.png" alt="DrawerLayout Screenshot Portrait"/>

-----

<img src="/Visuals/DrawerLayout_Screen_Shot_L.png" alt="DrawerLayout Screenshot Landscape "/>

-----


## License

This project is made available under the MIT license. See the LICENSE file for more details.
