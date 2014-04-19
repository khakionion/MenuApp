//
//  S3AppDelegate.h
//  MenuApp
//
//  Created by Michael Herring on 2014/04/19.
//  Copyright (c) 2014年 Sun, Sea and Sky Factory. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface S3AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (strong) IBOutlet NSMenu *menu;
@property (strong) NSStatusItem *menuItem;
@property (weak) IBOutlet NSMenuItem *dockIconMenuItem;

- (IBAction)toggleDockIcon:(id)sender;
- (IBAction)quitApp:(id)sender;

- (BOOL)dockIconHidingState;

@end
