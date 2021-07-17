//
//  CanvasView.m
//  JackNightsky-task8
//
//  Created by Jack on 17.07.21.
//

#import "CanvasView.h"
#import "ColorPalette.h"

@implementation CanvasView

-(void)reset {
    [self commonInit];
}


- (void) commonInit {
    
    self.layer.cornerRadius  = 8;
    self.layer.shadowColor   = UIColor.rsChillSky.CGColor;
    self.layer.shadowRadius  = 4;
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowOffset  = CGSizeMake(0, 0);
    
//    UIBezierPath * shadowPath0 = [UIBezierPath bezierPath];
//    (roundedRect: shadows.bounds, cornerRadius: 8)
//    CALayer * layer0 = [[CALayer alloc] init];
//    layer0.shadowPath = shadowPath0.CGPath;
//    layer0.shadowColor = UIColor.rsGreen.CGColor;
//    layer0.shadowOpacity = 1;
//    layer0.shadowRadius = 8;
//    layer0.shadowOffset = CGSizeMake(0, 0);
//    [layer0 setBounds: self.bounds];
//    layer0.position = self.center;
//    [self.layer addSublayer: layer0];
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
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
