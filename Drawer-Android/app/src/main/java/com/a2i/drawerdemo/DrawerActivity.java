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

package com.a2i.drawerdemo;

import android.content.Context;
import android.content.Intent;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.design.widget.NavigationView;
import android.support.v7.app.ActionBar;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.MenuItem;
import android.view.View;
import android.widget.TextView;

public class DrawerActivity extends AppCompatActivity {

    private DrawerLayout mDrawerLayout;
    private TextView tvLog;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_drawer);

        Toolbar toolbar = findViewById(R.id.toolbar);
        tvLog = findViewById(R.id.tvLog);
        setSupportActionBar(toolbar);

        ActionBar actionbar = getSupportActionBar();
        actionbar.setDisplayHomeAsUpEnabled(true);
        actionbar.setHomeAsUpIndicator(R.drawable.burger_menu_24);

        mDrawerLayout = findViewById(R.id.drawer_layout);
        mDrawerLayout.addDrawerListener(
                new DrawerLayout.DrawerListener() {
                    @Override
                    public void onDrawerSlide(View drawerView, float slideOffset) {
                        Log.i("RC","onDrawerSlide() called, slideOffset = " + slideOffset);
                        tvLog.setText("onDrawerSlide() called");
                    }

                    @Override
                    public void onDrawerOpened(View drawerView) {
                        Log.i("RC", "onDrawerOpened() called");
                        Log.i("RC", "isDrawerOpen() = " + mDrawerLayout.isDrawerOpen(GravityCompat.START));
                        Log.i("RC", "isDrawerOpen() = " + mDrawerLayout.isDrawerVisible(GravityCompat.START));
                        tvLog.setText("onDrawerOpened() called");
                    }

                    @Override
                    public void onDrawerClosed(View drawerView) {
                        Log.i("RC", "onDrawerClosed() called");
                        Log.i("RC", "isDrawerOpen() = " + mDrawerLayout.isDrawerOpen(GravityCompat.START));
                        Log.i("RC", "isDrawerOpen() = " + mDrawerLayout.isDrawerVisible(GravityCompat.START));
                        tvLog.setText("onDrawerClosed() called");
                    }

                    @Override
                    public void onDrawerStateChanged(int newState) {
                        Log.i("RC", "onDrawerStateChanged() called " + newState);
                        Log.i("RC", "isDrawerOpen() = " + mDrawerLayout.isDrawerOpen(GravityCompat.START));
                        Log.i("RC", "isDrawerOpen() = " + mDrawerLayout.isDrawerVisible(GravityCompat.START));
                        tvLog.setText("onDrawerStateChanged() called");
                    }
                }
        );

        NavigationView navigationView = findViewById(R.id.nav_view);
        navigationView.setNavigationItemSelectedListener(
                new NavigationView.OnNavigationItemSelectedListener() {
                    @Override
                    public boolean onNavigationItemSelected(MenuItem menuItem) {

                        // Set item as selected to persist highlight
                        menuItem.setChecked(true);

                        // Add code here to update the UI based on the item selected for example, swap UI fragments here
                        switch (menuItem.getItemId()) {
                            case R.id.nav_camera:
                                Log.i("RC","Camera menu clicked");
                                tvLog.setText("Camera menu clicked");
                                Intent cam_intent = new Intent(getApplicationContext(), CameraActivity.class);
                                startActivity(cam_intent);

                                return true;

                            case R.id.nav_gallery:
                                Log.i("RC","Gallery menu clicked");
                                tvLog.setText("Gallery menu clicked");
                                return true;

                            case R.id.nav_manage:
                                Log.i("RC","Manage menu clicked");
                                tvLog.setText("Manage menu clicked");
                                return true;

                            case R.id.nav_slideshow:
                                Log.i("RC","Slideshow menu clicked");
                                tvLog.setText("Slideshow menu clicked");
                                return true;

                            case R.id.drawerImage:
                                Log.i("RC","Drawer Image clicked");
                                tvLog.setText("Drawer Image clicked");
                                return true;

                            case R.id.drawerBtn:
                                // Android : Not working, onClick event is not fired for Drawer Header controls
                                Log.i("RC","Drawer menu clicked");
                                tvLog.setText("Drawer menu clicked");
                                return true;

                        }
                        return true;
                    }
                });
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case android.R.id.home:
                Log.i("RC","onOptionsItemSelected() called");
                tvLog.setText("onOptionsItemSelected() called");
                mDrawerLayout.openDrawer(GravityCompat.START);
                return true;
        }
        return super.onOptionsItemSelected(item);
    }

}
