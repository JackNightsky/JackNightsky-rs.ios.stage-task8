//
//  UserPaletteView.m
//  JackNightsky-task8
//
//  Created by Jack on 20.07.21.
//

#import "UserPaletteView.h"
#import "UIColor+Palette.h"

@implementation UserPaletteView

- (void) commonInit {
    self.backgroundColor = UIColor.rsWhite;
    
    self.layer.cornerRadius  = 40;
    
    self.layer.shadowColor   = [UIColor.rsBlack colorWithAlphaComponent:0.5].CGColor;
    self.layer.shadowRadius  = 8;
    self.layer.shadowOpacity = 1;
    self.layer.shadowOffset  = CGSizeMake(0, 0);
}


- (id)initWithCoder:(NSCoder *)aDecoder {
     self = [super initWithCoder:aDecoder];
     if (self) {
         [self commonInit];
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
