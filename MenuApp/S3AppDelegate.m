//
//  S3AppDelegate.m
//  MenuApp
//
//  Created by Michael Herring on 2014/04/19.
//  Copyright (c) 2014年 Sun, Sea and Sky Factory. All rights reserved.
//

#import "S3AppDelegate.h"

static NSString *dockHidingKey = @"com.sunseaskyfactory.menuapp.hidedockicon";

@interface S3AppDelegate ()

//updates the app's current hide state according to NSUserDefaults
- (void)updateAppState;
//inverts the current hide state in NSUserDefaults
- (void)toggleDockSetting;
//sets menu text to the appropriate value.
- (void)updateMenuText;

@end

@implementation S3AppDelegate

#pragma mark - subclass impls

- (void)awakeFromNib {
	self.menuItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSSquareStatusItemLength];
	self.menuItem.menu = self.menu;
	self.menuItem.image = [NSImage imageNamed:@"MenuExtra"];
	self.menuItem.alternateImage = [NSImage imageNamed:@"MenuExtraInverted"];
	self.menuItem.highlightMode = YES;
	[self updateAppState];
	[self updateMenuText];
}

#pragma mark - IBActions

- (IBAction)toggleDockIcon:(id)sender {
	[self toggleDockSetting];
	[self updateAppState];
	[self updateMenuText];
}

- (IBAction)quitApp:(id)sender {
	[[NSApplication sharedApplication] terminate:self];
}

#pragma mark - public impls

- (BOOL)dockIconHidingState {
	BOOL hideState = [[[NSUserDefaults standardUserDefaults] valueForKey:dockHidingKey] boolValue];
	return hideState;
}

#pragma mark - private impls

- (void)updateAppState {
	if ([self dockIconHidingState]) {
		[[NSApplication sharedApplication] setActivationPolicy:NSApplicationActivationPolicyAccessory];
	}
	else {
		[[NSApplication sharedApplication] setActivationPolicy:NSApplicationActivationPolicyRegular];
	}
}

- (void)updateMenuText {
	if ([self dockIconHidingState]) {
		self.dockIconMenuItem.title = NSLocalizedString(@"Show Dock Icon", @"Show the Dock icon");
	}
	else {
		self.dockIconMenuItem.title = NSLocalizedString(@"Hide Dock Icon", @"Hide the Dock icon");
	}
}

- (void)toggleDockSetting {
	[[NSUserDefaults standardUserDefaults] setValue:@(![self dockIconHidingState]) forKey:dockHidingKey];
}

@end
