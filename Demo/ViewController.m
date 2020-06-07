//
//  ViewController.m
//  Demo
//
//  Created by Carolina Franco on 10/28/18.
//  Copyright © 2018 Carolina Franco. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *lblIdentifier;
@property (weak, nonatomic) IBOutlet UIButton *btnCopy;
@property (nonatomic, strong) NSString *identifier;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.identifier = [self getDevideId];
    [self setDeviceID:self.identifier];
    [self setIdentifierIntoUI];
    self.btnCopy.layer.cornerRadius = 6;
    self.btnCopy.layer.masksToBounds = YES;
}

- (IBAction)copyIdentifier:(id)sender
{
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = self.identifier;
    self.lblIdentifier.text = @"¡Copiado!";
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(setIdentifierIntoUI) userInfo:nil repeats:NO];
}

-(void)setIdentifierIntoUI
{
    [self.lblIdentifier setText:self.identifier];
}

-(NSString *)getDevideId
{
    //UIDevice *device = [UIDevice currentDevice];
    //NSString *uniqueIdentifier = [[device identifierForVendor] UUIDString];
    NSString *uniqueIdentifier = @"81bcefc4-cc69-4ca1-92e3-143255d2d8c7";
    
    return uniqueIdentifier;
}

-(void)setDeviceID: (NSString *)deviceID
{
    NSUserDefaults *def = [[NSUserDefaults alloc] initWithSuiteName: @"group.SKE.Test"];
    [def setObject:deviceID forKey:@"deviceID"];
    [def synchronize];
}


@end
