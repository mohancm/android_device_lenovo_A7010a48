/*
 * Copyright (C) 2015 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.cyanogenmod.settings.device;

import android.app.ActivityManagerNative;
import android.app.NotificationManager;
import android.app.KeyguardManager;
import android.content.ActivityNotFoundException;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.media.session.MediaSessionLegacyHelper;
import android.net.Uri;
import android.os.Handler;
import android.os.Message;
import android.os.PowerManager;
import android.os.PowerManager.WakeLock;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.os.SystemClock;
import android.os.UserHandle;
import android.os.Vibrator;
import android.provider.MediaStore;
import android.provider.Settings;
import android.util.Log;
import android.view.KeyEvent;
import android.view.WindowManagerGlobal;
import android.view.ViewConfiguration;
import android.telecom.TelecomManager;
import com.android.internal.os.DeviceKeyHandler;
import com.android.internal.util.ArrayUtils;

public class KeyHandler implements DeviceKeyHandler {

    private static final String TAG = KeyHandler.class.getSimpleName();

    private final Context mContext;
    private Vibrator mVibrator;
    private final NotificationManager mNotificationManager;
    private Handler mHandler;
    private boolean mHomePressed;
    private boolean mHomeConsumed;
    private boolean mHomeDoubleTapPending;

    private class PolicyHandler extends Handler {
        @Override
        public void handleMessage(Message msg) {
            switch (msg.what) {

            }
        }
    }
    private final Runnable mHomeDoubleTapTimeoutRunnable = new Runnable() {
        @Override
        public void run() {
            if (mHomeDoubleTapPending) {
                mHomeDoubleTapPending = false;
                doHapticFeedback();
                Log.i(TAG, "The key is home press");
            }
        }
    };
    private void handleLongPressOnHome(int deviceId) {
            mHomeConsumed = true;
            Log.i(TAG, "The key is home longpress");
    }

    private void handleDoubleTapOnHome() {
            mHomeConsumed = true;
            Log.i(TAG, "The key is home doubletap");
    }

    public KeyHandler(Context context) {
        mContext = context;
        mHandler = new PolicyHandler();
        mNotificationManager
                = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
        mVibrator = (Vibrator) context.getSystemService(Context.VIBRATOR_SERVICE);
        if (mVibrator == null || !mVibrator.hasVibrator()) {
            mVibrator = null;
        }
    }

    public boolean handleKeyEvent(KeyEvent event) {
        int scanCode = event.getScanCode();
        int keyCode = event.getKeyCode();
        int repeatCount = event.getRepeatCount();
        int flags = event.getFlags();
        boolean down = event.getAction() == KeyEvent.ACTION_DOWN;
        boolean canceled = event.isCanceled();
        boolean longPress = (flags & KeyEvent.FLAG_LONG_PRESS) != 0;
        //Log.i(TAG, "The key is " + scanCode);
        /*if (event.getAction() != KeyEvent.ACTION_UP) {
            return false;
        }*/
        if (scanCode==250 && longPress && down) {
            if (mNotificationManager.getZenMode() == Settings.Global.ZEN_MODE_OFF){
                mNotificationManager.setZenMode(Settings.Global.ZEN_MODE_IMPORTANT_INTERRUPTIONS, null, TAG);
            } else if (mNotificationManager.getZenMode() == Settings.Global.ZEN_MODE_IMPORTANT_INTERRUPTIONS){
                mNotificationManager.setZenMode(Settings.Global.ZEN_MODE_ALARMS, null, TAG);
            } else if (mNotificationManager.getZenMode() == Settings.Global.ZEN_MODE_ALARMS){
                mNotificationManager.setZenMode(Settings.Global.ZEN_MODE_NO_INTERRUPTIONS, null, TAG);
            } else if (mNotificationManager.getZenMode() == Settings.Global.ZEN_MODE_NO_INTERRUPTIONS){
                mNotificationManager.setZenMode(Settings.Global.ZEN_MODE_OFF, null, TAG);
            }
            Log.i(TAG, "The key is Slider");
            doHapticFeedback();
            return true;
        } else if (scanCode==102) {
            Log.i(TAG, "The key is home");
            /*if (longPress) {
                Log.i(TAG, "longpress");
            }else {
                Log.i(TAG, "not longpress");
            }
            if (!down) {
                //cancelPreloadRecentApps();

                mHomePressed = false;
                if (mHomeConsumed) {
                    mHomeConsumed = false;
                    return true;
                }

                if (canceled) {
                    Log.i(TAG, "Ignoring HOME; event canceled.");
                    return true;
                }

                // If an incoming call is ringing, HOME is totally disabled.
                // (The user is already on the InCallUI at this point,
                // and his ONLY options are to answer or reject the call.)
                TelecomManager telecomManager = (TelecomManager) mContext.getSystemService(Context.TELECOM_SERVICE);
                if (telecomManager != null && telecomManager.isRinging()) {
                    Log.i(TAG, "Ignoring HOME; there's a ringing incoming call.");
                    return true;
                }

                    mHandler.removeCallbacks(mHomeDoubleTapTimeoutRunnable); // just in case
                    mHomeDoubleTapPending = true;
                    mHandler.postDelayed(mHomeDoubleTapTimeoutRunnable,
                            ViewConfiguration.getDoubleTapTimeout());
                    return true;
            }
            // Remember that home is pressed and handle special actions.
            if (repeatCount == 0) {
                Log.i(TAG, "count 0");
                mHomePressed = true;
                if (mHomeDoubleTapPending) {
                    mHomeDoubleTapPending = false;
                    mHandler.removeCallbacks(mHomeDoubleTapTimeoutRunnable);
                    handleDoubleTapOnHome();
                } else {
                    //preloadRecentApps();
                }
            //} else if (longPress) {
            } else {
                //if (!keyguardOn) {
                    handleLongPressOnHome(event.getDeviceId());
                //}
            }
            doHapticFeedback();
            return true;*/
        }
        return false;
    }

    private void doHapticFeedback() {
        if (mVibrator == null) {
            return;
        }
        mVibrator.vibrate(50);
    }
}
