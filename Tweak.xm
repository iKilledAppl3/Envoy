/* Envoy is a tweak created to disable useless features found in the Facebook Messenger application */

//Copyright 2016 - 2017 iKilledAppl3 and ToxicAppl3 Inc. All rights reserved.//


//Headers

#import <UIKit/UIKit.h>

//Declarations

BOOL hideActive;
BOOL hideFav;
BOOL hideLabels;

//prefs plist file
#define plist @"/var/mobile/Library/Preferences/com.ikilledappl3.envoy.plist"

//Active Now Methods 

%hook MNInboxActiveNowContactsListViewController

-(void)viewDidLoad {
	if (hideActive == YES) {	
			
	NULL;
			
}
		
else {
	%orig; 
	}
		
}


%end

%hook MNInboxTopActiveNowContactSubscriber 
		
-(id)topActiveNowContacts {
	if (hideActive == YES) {
		
		return NULL;
			
		}
		
	else {
		return %orig;
	}
		
}
%end

//Favorites Method
	
%hook MNThreadCollectionViewModel 
-(bool)shouldShowNames {
	if (hideFav ==  YES) {
		return FALSE;
		}
		
		else {
			return %orig;
		}
}

-(id)actorsToDisplay {
	if (hideFav == YES) {
		return  nil;
	}
	
	else {
		return %orig;
	}
}

-(id)layoutConfiguration {
	if (hideFav == YES) {
		return  nil;
	}
	
	else {
		return %orig;
	}
}

-(id)sectionHeader {
	if (hideFav == YES) {
		return  nil;
	}
	
	else {
		return %orig;
	}
}

-(double)imageSize {
	if (hideFav == YES) {
		return 0;
	}
	
	else {
		return %orig;
	}
}

-(double)verticalPadding {
	if (hideFav == YES) {
		return 0;
	}
	
	else {
		return %orig;
	}
}

-(id)collectionId {
	if (hideFav == YES) {
		return nil;
	}
	
	else {
		return %orig;
	}
}
%end

%hook MNThreadSectionHeaderViewCell 
-(id)viewModel	{
	if (hideLabels == YES) {
		return nil;
	} 
	
	else {
		return %orig;
	}
}

-(void)setViewModel:(id)arg1 {
	if (hideLabels == YES) {
		arg1 = nil;
	} 
	
	else {
		%orig(arg1);
	}
}

-(void)_updateSeparator {
	if (hideLabels == YES) {
		nil;
	} 
	
	else {
		%orig;
	}
}

-(void) _updateButtonWithOldViewModel:(id)arg1 {
	if (hideLabels == YES) {
		YES;
	} 
	
	else {
		%orig;
	}
}
-(void) setThreadCellLayout:(id)arg1 {
	if (hideLabels == YES) {
		arg1 = nil;
	} 
	
	else {
		%orig(arg1);
	}
}

-(id)delegate {
	if (hideLabels == YES) {
		return nil;
	} 
	
	else {
		return %orig;
	}
}

-(id)threadCellLayout {
	if (hideLabels == YES) {
		return nil;
	} 
	
	else {
		return %orig;
	}
}

-(void)setDelegate:(id)arg1 {
	if (hideLabels == YES) {
		arg1 = nil;
	} 
	
	else {
		%orig(arg1);
	}
}
-(void)layoutSubviews {
	if (hideLabels == YES) {
		nil;
	} 
	
	else {
		%orig;
	}
}

-(void)dealloc {
	if (hideLabels == YES) {
		nil;
	} 
	
	else {
		%orig;
	}
}
%end	

	
//Preferences 
	
	static void loadPrefs()
	{

	NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:plist];
  

	if (prefs)
	  
	hideFav = ([prefs objectForKey:@"hideFav"] ? [[prefs objectForKey:@"hideFav"] boolValue] : hideFav);
	hideActive = ([prefs objectForKey:@"hideActive"] ? [[prefs objectForKey:@"hideActive"] boolValue] : hideActive);
	hideLabels = ([prefs objectForKey:@"hideLabels"] ? [[prefs objectForKey:@"hideLabels"] boolValue] : hideLabels);

    {					   
}
	}

	%ctor 

{

	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.ikilledappl3.envoy.plist-changed"), NULL, CFNotificationSuspensionBehaviorCoalesce);

		    loadPrefs();

		}
