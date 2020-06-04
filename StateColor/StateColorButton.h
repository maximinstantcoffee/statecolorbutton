//
//  StateColorButton.h
//  StateColor
//
//  Copyright © 2020 StateColor. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface StateColorButton : UIButton

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;

@end

NS_ASSUME_NONNULL_END
