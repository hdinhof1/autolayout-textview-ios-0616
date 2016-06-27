//
//  ViewController.m
//  LearningAboutAnchors
//
//  Created by Henry Dinhofer on 6/27/16.
//  Copyright © 2016 Henry Dinhofer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property (weak, nonatomic) IBOutlet UIButton *leftButton;

@property (weak, nonatomic) IBOutlet UIButton *rightButton;

@property (weak, nonatomic) IBOutlet UITextView *textView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view removeConstraints:self.view.constraints];
    self.view.translatesAutoresizingMaskIntoConstraints = NO;

    self.leftButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.leftButton removeConstraints:self.leftButton.constraints];
    
    self.rightButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.rightButton removeConstraints:self.rightButton.constraints];
    
    self.textView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.textView removeConstraints:self.textView.constraints];

    
    [self.leftButton.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:10.f].active = YES;
    [self.leftButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-10.f].active = YES;

    [self.rightButton.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-10.f].active = YES;
    [self.rightButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-10.f].active = YES;
    
    [self.textView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:20.f].active = YES;
    [self.textView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:10.f].active = YES;
    
    [self.textView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-10.f].active = YES;
    [self.textView.bottomAnchor constraintEqualToAnchor:self.leftButton.topAnchor constant:-50.f].active = YES;
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange: previousTraitCollection];
    if ((self.traitCollection.verticalSizeClass != previousTraitCollection.verticalSizeClass)
        || (self.traitCollection.horizontalSizeClass != previousTraitCollection.horizontalSizeClass)) {
        //standard check if screen has rotated
        
        if ((self.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClassCompact) &&
            (self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClassCompact)) {
            
            [self.view removeConstraints:self.view.constraints];
            
            self.textView.translatesAutoresizingMaskIntoConstraints = NO;
            [self.textView removeConstraints:self.textView.constraints];

            
            [self.textView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:20.f].active = YES;
            [self.textView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:10.f].active = YES;
            [self.textView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-10.f].active = YES;
            [self.textView.bottomAnchor constraintEqualToAnchor:self.leftButton.topAnchor constant:-10.f].active = YES;
            NSLog(@"Are we here");
            //horizontal = compact, vertical = regular --> portrait
            //horizontal = compact, vertical = compact --> landscape
        }
        
            //compact = 1, regular = 2, unspecified = 3
        //NSLog(@"Phone is \n%@", self.traitCollection);

    }
}

@end
