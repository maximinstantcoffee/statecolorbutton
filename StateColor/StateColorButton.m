//
//  StateColorButton.m
//  StateColor
//
//  Copyright © 2020 StateColor. All rights reserved.
//

#import "StateColorButton.h"

@interface StateColorButton()

@property (nonatomic, strong) NSMutableDictionary *backgroundColors;

@end

@implementation StateColorButton
#pragma mark - Background Colors

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state {
    if (!self.backgroundColors) {
        self.backgroundColors = [[NSMutableDictionary alloc] init];
        
    }
    if (backgroundColor) {
        self.backgroundColors[@(state)] = backgroundColor;
    }
    
    if (state == UIControlStateNormal) {
        self.backgroundColor = backgroundColor;
    }
}

- (void)transitionBackgroundToColor:(UIColor*)color {
    CATransition *animation = [CATransition animation];
    animation.type = kCATransitionFade;
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [self.layer addAnimation:animation forKey:@"EaseOut"];
    self.backgroundColor = color;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    UIColor *selectedColor = self.backgroundColors[@(UIControlStateHighlighted)];
    if (selectedColor) {
        [self transitionBackgroundToColor:selectedColor];
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
    
    UIColor *normalColor = self.backgroundColors[@(UIControlStateNormal)];
    if (normalColor) {
        [self transitionBackgroundToColor:normalColor];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    
    UIColor *normalColor = self.backgroundColors[@(UIControlStateNormal)];
    if (normalColor) {
        [self transitionBackgroundToColor:normalColor];
    }
}

- (void)setEnabled:(BOOL)enabled
{
    [super setEnabled:enabled];
    if (enabled){
        self.backgroundColor = self.backgroundColors[@(UIControlStateNormal)];
    }else{
        self.backgroundColor = self.backgroundColors[@(UIControlStateDisabled)];
    }
}

@end
