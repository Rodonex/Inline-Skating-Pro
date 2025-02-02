// https://developer.garmin.com/connect-iq/core-topics/native-controls/
using Toybox.WatchUi;
using Toybox.System;
using Toybox.Application;

class SkatingMenuStopDelegate extends WatchUi.MenuInputDelegate {

	hidden var _fitManager;
	hidden var _controller;

    function initialize() {
        System.println("initialize SkatingMenuDelegate");
        MenuInputDelegate.initialize();
        _fitManager = Application.getApp().fitManager;
        _controller = Application.getApp().controller;
        _fitManager.pauseSession();
    }

    function onMenuItem(item) {
    	if (item == :item_1) {
            _controller.userFeedbackNotification(3);
    		_fitManager.continueSession();
        } else if (item == :item_2) {
            _controller.userFeedbackNotification(4);
        	_controller.stopRecording(true);
        } else if (item == :item_3) {
            _controller.userFeedbackNotification(5);
        	_controller.stopRecording(false);
        }
    }

}