#import <CepheiPrefs/HBListController.h>
#import <CepheiPrefs/HBTintedTableCell.h>
#import <CepheiPrefs/HBRootListController.h>
#import <CepheiPrefs/HBTwitterCell.h>
#import <CepheiPrefs/HBImageTableCell.h>
#import <CepheiPrefs/HBPackageNameHeaderCell.h>

UIView *window;


@interface EnvoyPrefsListController: HBListController {
}

@end

@implementation EnvoyPrefsListController

+ (NSString *)hb_specifierPlist {
	return @"EnvoyPrefs";
}

+ (UIColor *)hb_tintColor {
	return [UIColor colorWithRed:0.0/255.0 green:123.0/255.0 blue:184.0/255.0 alpha:1.0];
}

- (void)loadView {
    [super loadView];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(shareTapped)];


}
- (void)shareTapped {
	NSString *text = [NSString stringWithFormat:@"Enhance your Facebook Messenger experience! Download #Envoy by @iKilledAppl3 today on the BigBoss repo!"];

	if ([UIActivityViewController alloc]) {
		UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[text] applicationActivities:nil];
		[(UINavigationController *)[super navigationController] presentViewController:activityViewController animated:YES completion:NULL];
	}else {
		//awesomeness
	}
}


-(void)respring {


UIAlertView *alertUser = [[UIAlertView alloc] 
	initWithTitle:@"Apply Changes"
		message:@"To apply changes Messenger must be open in the background.\n\n I added this because some settings wouldn't apply correctly." 
			delegate:self 
				cancelButtonTitle:@"Cancel" otherButtonTitles:@"Respring", nil];

[alertUser show];
[alertUser release];
} 

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	if (buttonIndex == 0) {
		// Cancel Action //
	}
	else if (buttonIndex == 1)	{
		//Resrping the device //
		
	system ("killall -9 Messenger");
	
	system ("killall -9 backboardd");
	}
	
}


-(void)paypal {
	
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://is.gd/donate2ToxicAppl3Inc"]];
}


-(void)messengerTweak1 {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://cydia.saurik.com/package/com.ikilledappl3.nopushmnfixer/"]];
}

-(void)messengerTweak2 {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://cydia.saurik.com/package/com.ikilledappl3.nofbmesstoast/"]];
}

-(void)messengerTweak3 {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://cydia.saurik.com/package/org.thebigboss.messengerplus/"]];
}

@end

// vim:ft=objc
