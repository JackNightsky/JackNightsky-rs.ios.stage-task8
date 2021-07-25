//
//  ColorChoose.m
//  JackNightsky-task8
//
//  Created by Jack on 20.07.21.
//

#import "ColorChoose.h"
#import "UIColor+Palette.h"

@implementation ColorChoose


- (void) commonInit {
    // crutch
    
    
    self.layer.cornerRadius  = 10;
    
    self.layer.shadowColor   = [UIColor.rsBlack colorWithAlphaComponent:0.5].CGColor;
    self.layer.shadowRadius  = 2;
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowOffset  = CGSizeMake(0, 0);
    
}


- (id)initWithCoder:(NSCoder *)aDecoder {
     self = [super initWithCoder:aDecoder];
     if (self) {
         [self commonInit];
         
         // Set title color for states
 
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
