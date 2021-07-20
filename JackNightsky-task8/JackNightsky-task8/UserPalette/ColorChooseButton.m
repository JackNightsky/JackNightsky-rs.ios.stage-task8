//
//  ColorChooseButton.m
//  JackNightsky-task8
//
//  Created by Jack on 20.07.21.
//

#import "ColorChooseButton.h"
#import "ColorPalette.h"

@interface ColorChooseButton ()

@end


@implementation ColorChooseButton



- (void) commonInit {
    // crutch
    self.choosed = NO;
    
    if (!self.isEnabled) {
        self.alpha = 0.5;
    }
    
//    [self setBounds: CGRectMake(0, 0, 40, 40)];
    
    self.titleLabel.text = @"";
    
    self.titleLabel.font = [UIFont fontWithName:@"Montserrat-Medium" size:0];
    
    // Button appearance for state NORMAL
//    self.backgroundColor = UIColor.rsBlue;
//    self.titleLabel.backgroundColor = UIColor.rsBlue;
    
    [self setTitleColor:UIColor.rsLightGreenSea forState:UIControlStateNormal];
    
    self.layer.cornerRadius  = 6;
    
//    [self addTarget:self
//             action:@selector(buttonTap:)
//   forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)buttonTapOn {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];

        CGAffineTransform transform = CGAffineTransformMakeScale(1.4, 1.4);
        self.layer.cornerRadius = 6;
        [self setTransform:transform];
    
    [UIView commitAnimations];

}

-(void)buttonTapOff {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];

    CGAffineTransform transform = CGAffineTransformMakeScale(1, 1);
    self.layer.cornerRadius = 6;
    [self setTransform:transform];
    
    [UIView commitAnimations];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
     self = [super initWithCoder:aDecoder];
     if (self) {
         [self commonInit];
         
         // Set title color for states
         [self setTitleColor:UIColor.rsLightGreenSea forState:UIControlStateNormal];
         [self setTitleColor:[UIColor.rsLightGreenSea colorWithAlphaComponent:1] forState:UIControlStateHighlighted];
         [self setTitleColor:[UIColor.rsLightGreenSea colorWithAlphaComponent:1] forState:UIControlStateDisabled];
     }
     return self;
 }


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
