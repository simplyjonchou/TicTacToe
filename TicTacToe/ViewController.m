//
//  ViewController.m
//  TicTacToe
//
//  Created by Jonathan Chou on 10/23/14.
//  Copyright (c) 2014 Jonathan Chou. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelOne;
@property (weak, nonatomic) IBOutlet UILabel *labelTwo;
@property (weak, nonatomic) IBOutlet UILabel *labelThree;
@property (weak, nonatomic) IBOutlet UILabel *labelFour;
@property (weak, nonatomic) IBOutlet UILabel *labelFive;
@property (weak, nonatomic) IBOutlet UILabel *labelSix;
@property (weak, nonatomic) IBOutlet UILabel *labelSeven;
@property (weak, nonatomic) IBOutlet UILabel *labelEight;
@property (weak, nonatomic) IBOutlet UILabel *labelNine;
@property (weak, nonatomic) IBOutlet UILabel *whichPlayerLabel;
@property (nonatomic) BOOL isPlayerX;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)findLabelUsingPoint: (CGPoint)point{
    if(CGRectContainsPoint(self.labelOne.frame, point)){
        [self labelPressed:self.labelOne];}
    if(CGRectContainsPoint(self.labelTwo.frame, point)){
        [self labelPressed:self.labelTwo];}
    if(CGRectContainsPoint(self.labelThree.frame, point)){
        [self labelPressed:self.labelThree];}
    if(CGRectContainsPoint(self.labelFour.frame, point)){
        [self labelPressed:self.labelFour];}
    if(CGRectContainsPoint(self.labelFive.frame, point)){
        [self labelPressed:self.labelFive];}
    if(CGRectContainsPoint(self.labelSix.frame, point)){
        [self labelPressed:self.labelSix];}
    if(CGRectContainsPoint(self.labelSeven.frame, point)){
        [self labelPressed:self.labelSeven];}
    if(CGRectContainsPoint(self.labelEight.frame, point)){
        [self labelPressed:self.labelEight];}
    if(CGRectContainsPoint(self.labelNine.frame, point)){
        [self labelPressed:self.labelNine];}
}

- (void)labelPressed:(UILabel *)labelPressed{
//if label 1-9 countains cgpoint(mouse) - change to x or o
//if already x or o do nothing.
//change bool value
    
    //BOOL isPlayerX = YES;
    if(!labelPressed.userInteractionEnabled){//check if label has been pressed before
        if(!self.isPlayerX){
            labelPressed.text = @"X";
            labelPressed.textColor = [UIColor blueColor];
            self.whichPlayerLabel.text = @"O";}
        else{labelPressed.text = @"O";
            labelPressed.textColor = [UIColor redColor];
            self.whichPlayerLabel.text = @"X";}
        self.isPlayerX = !(self.isPlayerX);
        if( [self hasPlayerWon:labelPressed])
            self.whichPlayerLabel.text = [self.whichPlayerLabel.text stringByAppendingString:@" LOSESSSSSSSSS!"];
    }//taking turns
    labelPressed.userInteractionEnabled = YES;//disable label
    //}
}

- (BOOL)checkOneTwoThree{
    if([self.labelOne.text isEqualToString:self.labelTwo.text] && [self.labelOne.text isEqualToString:self.labelThree.text]){
        return YES;}
    else
        return NO;
}

- (BOOL)checkFourFiveSix{
    if([self.labelFour.text isEqualToString:self.labelFive.text] && [self.labelFour.text isEqualToString:self.labelSix.text]){
        return YES;}
    else
        return NO;
}
- (BOOL)checkSevenEightNine {
    if([self.labelSeven.text isEqualToString:self.labelEight.text] && [self.labelSeven.text isEqualToString:self.labelNine.text]){
        return YES;}
    else
        return NO;

}


- (BOOL)hasPlayerWon:(UILabel *)labelPressed{
    
    
    //123 456 789 147 258 369 159 357
    
    //123 147 159 #1
    //123
    if(labelPressed == self.labelOne || labelPressed == self.labelTwo || labelPressed == self.labelThree){
        return [self checkOneTwoThree];}

    else if (labelPressed == self.labelFour || labelPressed == self.labelFive || labelPressed == self.labelSix){
        return [self checkFourFiveSix];}

    else if (labelPressed == self.labelSeven || labelPressed == self.labelEight || labelPressed == self.labelNine){
        return [self checkSevenEightNine];}
//        if([self.labelOne.text isEqualToString:self.labelFour.text] && [self.labelOne.text isEqualToString:self.labelSeven.text]){
//            return YES;}
//        else if([self.labelOne.text isEqualToString:self.labelFive.text] && [self.labelOne.text isEqualToString:self.labelNine.text]){
//            return YES;}
    else{
        return NO;}
}

- (IBAction)onLabelTapped:(id)sender {
    CGPoint point = [sender locationInView:self.view];
    [self findLabelUsingPoint:point];
}

@end
