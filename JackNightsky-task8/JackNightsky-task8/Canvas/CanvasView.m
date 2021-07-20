//
//  CanvasView.m
//  JackNightsky-task8
//
//  Created by Jack on 17.07.21.
//

#import "CanvasView.h"
#import "ColorPalette.h"
#import "PlistWorker.h"
#import "ArtistViewController.h"

@interface CanvasView ()
@property (nonatomic) CAShapeLayer * layer0;
@property (nonatomic) CAShapeLayer * layer1;
@property (nonatomic) CAShapeLayer * layer2;
@end


@implementation CanvasView


-(void)resetProgress:(float)progress {
    _progress = 0;
}

-(void)changeStrokeEnd{
    
    [_layer0 setStrokeEnd: _progress];
    [_layer1 setStrokeEnd: _progress];
    [_layer2 setStrokeEnd: _progress];
    
    NSLog(@"drawDuration from file: %@", [PlistWorker readValueForKey:@"drawDuration"]);
    NSString* drawDuration = [PlistWorker readValueForKey:@"drawDuration"];
    NSLog(@"drawDuration: %f", drawDuration.floatValue / 100);
    float duration = drawDuration.floatValue / 100;
    NSLog(@"duration: %f", duration);
    
    
    if (_progress < 1) {
        _progress += 1 / (duration * 60);
    } else {
        _progress = 1;
        
    }
    NSLog(@"progress = %f", _progress);
}

-(void)reverseStrokeStart {
    
    [_layer0 setStrokeEnd: _progress];
    [_layer1 setStrokeEnd: _progress];
    [_layer2 setStrokeEnd: _progress];
    
    if (_progress > 0.1) {
        _progress -= 0.1;
    } else {
        _progress = 0;
    }
    NSLog(@"progress = %f", _progress);
}



-(void)reset {
    [self commonInit];
    [self.layer.sublayers makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
    _layer0 = [CAShapeLayer layer];
    _layer1 = [CAShapeLayer layer];
    _layer2 = [CAShapeLayer layer];
//    _progress = 0;
    [self setNeedsDisplay];
}


- (void) commonInit {
//    _progress = 0;
    self.backgroundColor = UIColor.rsWhite;
    self.layer.cornerRadius  = 8;
    self.layer.shadowColor   = UIColor.rsChillSky.CGColor;
    self.layer.shadowRadius  = 4;
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowOffset  = CGSizeMake(0, 0);
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

// MARK: - drawHead
- (void)drawHead:(UIColor*)color0 :(UIColor*)color1 :(UIColor*)color2 {
    [self reset];
    
    _layer0 = [CAShapeLayer layer];
    _layer1 = [CAShapeLayer layer];
    _layer2 = [CAShapeLayer layer];
    
    
    _layer0.bounds = CGRectMake(-150, -150, 340, 340);
    _layer1.bounds = CGRectMake(-150, -150, 340, 340);
    _layer2.bounds = CGRectMake(-150, -150, 340, 340);
    
    // path0
    UIBezierPath * path0 = [UIBezierPath bezierPath];
    [path0 moveToPoint:CGPointMake(81.5, 49)];
    [path0 addLineToPoint:CGPointMake(97, 109)];
    [path0 addLineToPoint:CGPointMake(109, 132)];
    [path0 addLineToPoint:CGPointMake(126.5, 151.5)];
    [path0 addLineToPoint:CGPointMake(153.5, 174)];
    [path0 addLineToPoint:CGPointMake(177, 179.5)];
    [path0 addLineToPoint:CGPointMake(213, 162)];
    [path0 addLineToPoint:CGPointMake(240, 132)];
    [path0 addLineToPoint:CGPointMake(248.5, 120)];
    [path0 addLineToPoint:CGPointMake(250.5, 70.5)];
    [path0 addLineToPoint:CGPointMake(238.5, 60.5)];
    [path0 addLineToPoint:CGPointMake(222, 63.5)];
    [path0 addLineToPoint:CGPointMake(211, 80.5)];
    [path0 addLineToPoint:CGPointMake(209, 103.5)];
    [path0 addLineToPoint:CGPointMake(213, 116)];

    // MARK: - path1
    UIBezierPath * path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:CGPointMake(204, 120)];
    [path1 addLineToPoint:CGPointMake(195.5, 118.5)];
    [path1 addLineToPoint:CGPointMake(186, 120.5)];
    [path1 addLineToPoint:CGPointMake(178, 121.5)];
    [path1 addLineToPoint:CGPointMake(168.5, 120.5)];
    [path1 addLineToPoint:CGPointMake(160, 119)];
    [path1 addLineToPoint:CGPointMake(153.5, 118.5)];
    [path1 addLineToPoint:CGPointMake(146, 120)];
    [path1 addLineToPoint:CGPointMake(141.5, 122)];
    [path1 addLineToPoint:CGPointMake(147.5, 124.5)];
    [path1 addLineToPoint:CGPointMake(152, 128)];
    [path1 addLineToPoint:CGPointMake(156.5, 133)];
    [path1 addLineToPoint:CGPointMake(162.5, 135.5)];
    [path1 addLineToPoint:CGPointMake(170, 136.5)];
    [path1 addLineToPoint:CGPointMake(177, 135.5)];
    [path1 addLineToPoint:CGPointMake(184.5, 136.5)];
    [path1 addLineToPoint:CGPointMake(190.5, 135.5)];
    [path1 addLineToPoint:CGPointMake(197, 131.5)];
    [path1 addLineToPoint:CGPointMake(204, 123.5)];
    [path1 addLineToPoint:CGPointMake(208.5, 117.5)];
    [path1 addLineToPoint:CGPointMake(200.5, 116.5)];
    [path1 addLineToPoint:CGPointMake(191.5, 115.5)];
    [path1 addLineToPoint:CGPointMake(182.5, 113.5)];
    [path1 addLineToPoint:CGPointMake(174, 113)];
    [path1 addLineToPoint:CGPointMake(164, 114.5)];
    [path1 addLineToPoint:CGPointMake(155, 116.5)];
    [path1 addLineToPoint:CGPointMake(145, 117.5)];
    [path1 addLineToPoint:CGPointMake(138, 117)];
    [path1 addLineToPoint:CGPointMake(147.5, 111)];
    [path1 addLineToPoint:CGPointMake(156.5, 104.5)];
    [path1 addLineToPoint:CGPointMake(162.5, 101)];
    [path1 addLineToPoint:CGPointMake(167.5, 102.5)];
    [path1 addLineToPoint:CGPointMake(173, 104.5)];
    [path1 addLineToPoint:CGPointMake(179.5, 103.5)];
    [path1 addLineToPoint:CGPointMake(186, 102.5)];
    [path1 addLineToPoint:CGPointMake(194.5, 104.5)];
    [path1 addLineToPoint:CGPointMake(199.5, 109.5)];
    [path1 addLineToPoint:CGPointMake(207, 114)];
    

    // MARK: - path2
    UIBezierPath * path2 = [UIBezierPath bezierPath];
    [path2 moveToPoint:CGPointMake(209.5, 122.5)];
    [path2 addLineToPoint:CGPointMake(214, 128.5)];
    [path2 addLineToPoint:CGPointMake(216.5, 135)];
    [path2 addLineToPoint:CGPointMake(213, 144)];
    [path2 addLineToPoint:CGPointMake(206, 152.5)];
    [path2 addLineToPoint:CGPointMake(197, 159.5)];
    [path2 addLineToPoint:CGPointMake(187.5, 152.5)];
    [path2 addLineToPoint:CGPointMake(177, 148.5)];
    [path2 addLineToPoint:CGPointMake(155.5, 152.5)];
    [path2 addLineToPoint:CGPointMake(147.5, 162)];
    [path2 addLineToPoint:CGPointMake(141, 174.5)];
    [path2 addLineToPoint:CGPointMake(129.5, 167.5)];
    [path2 addLineToPoint:CGPointMake(121.5, 157.5)];
    [path2 addLineToPoint:CGPointMake(113, 148.5)];
    [path2 addLineToPoint:CGPointMake(106, 219)];
    [path2 addLineToPoint:CGPointMake(94.5, 227.5)];
    [path2 addLineToPoint:CGPointMake(83.5, 234.5)];
    [path2 addLineToPoint:CGPointMake(101, 241)];
    [path2 addLineToPoint:CGPointMake(114.5, 249.5)];
    [path2 addLineToPoint:CGPointMake(125, 263.5)];
    [path2 addLineToPoint:CGPointMake(139, 281)];
    [path2 addLineToPoint:CGPointMake(158, 299)];
    [path2 addLineToPoint:CGPointMake(177, 305.5)];
    [path2 addLineToPoint:CGPointMake(206, 297.5)];
    [path2 addLineToPoint:CGPointMake(219.5, 281)];
    [path2 addLineToPoint:CGPointMake(229.5, 259.5)];
    [path2 addLineToPoint:CGPointMake(239, 243.5)];
    [path2 addLineToPoint:CGPointMake(253.5, 237)];
    [path2 addLineToPoint:CGPointMake(250.5, 221.5)];
    [path2 addLineToPoint:CGPointMake(241, 193)];
    [path2 addLineToPoint:CGPointMake(239, 170)];
    [path2 addLineToPoint:CGPointMake(232, 157.5)];
    [path2 addLineToPoint:CGPointMake(224, 165.5)];
    [path2 addLineToPoint:CGPointMake(216.5, 174.5)];
    [path2 addLineToPoint:CGPointMake(200, 190.5)];
    [path2 addLineToPoint:CGPointMake(190, 205)];
    [path2 addLineToPoint:CGPointMake(181.5, 226.5)];
    [path2 addLineToPoint:CGPointMake(178.5, 252.5)];
    
    
    // MARK: - add
    
    [_layer0 setLineWidth:2];
    [_layer0 setPath:path0.CGPath];
    [_layer0 setStrokeColor:color0.CGColor];
    [_layer0 setFillColor:nil];
    [_layer0 setStrokeStart:0.0];
    [_layer0 setStrokeEnd:0.0];
    [self.layer addSublayer:_layer0];

    [_layer1 setPath:path1.CGPath];
    [_layer1 setStrokeColor:color1.CGColor];
    [_layer1 setFillColor:nil];
    [_layer1 setStrokeStart:0.0];
    [_layer1 setStrokeEnd:0.0];
    [self.layer addSublayer:_layer1];

    [_layer2 setPath:path2.CGPath];
    [_layer2 setStrokeColor:color2.CGColor];
    [_layer2 setFillColor:nil];
    [_layer2 setStrokeStart:0.0];
    [_layer2 setStrokeEnd:0.0];
    [self.layer addSublayer:_layer2];

    [self clearsContextBeforeDrawing];
    [self.layer setNeedsLayout]; // мб поможет обновлять лэер в будущем.
} // drawHead


// MARK: - drawPlanet
- (void)drawPlanet:(UIColor*)color0 :(UIColor*)color1 :(UIColor*)color2 {
    
    [self reset]; // delete before drawing
    
    _layer0 = [CAShapeLayer layer];
    _layer1 = [CAShapeLayer layer];
    _layer2 = [CAShapeLayer layer];
    
    
    _layer0.bounds = CGRectMake(-150, -150, 340, 340);
    _layer1.bounds = CGRectMake(-150, -150, 340, 340);
    _layer2.bounds = CGRectMake(-150, -150, 340, 340);
    
    // path0 planet and ring
    UIBezierPath * path0 = [UIBezierPath bezierPath];
    [path0 moveToPoint:CGPointMake( 80.5, 174)];
    [path0 addLineToPoint:CGPointMake( 71.5, 178)];
    [path0 addLineToPoint:CGPointMake( 62.5, 185)];
    [path0 addLineToPoint:CGPointMake( 54, 193)];
    [path0 addLineToPoint:CGPointMake( 48, 201)];
    [path0 addLineToPoint:CGPointMake( 46, 209)];
    [path0 addLineToPoint:CGPointMake( 47, 217)];
    [path0 addLineToPoint:CGPointMake( 51, 223.5)];
    [path0 addLineToPoint:CGPointMake( 58, 229)];
    [path0 addLineToPoint:CGPointMake( 68.5, 233.5)];
    [path0 addLineToPoint:CGPointMake( 79.5, 236)];
    [path0 addLineToPoint:CGPointMake( 91, 237)];
    [path0 addLineToPoint:CGPointMake( 102, 237.5)];
    [path0 addLineToPoint:CGPointMake( 108.5, 237.3)];
    [path0 moveToPoint:CGPointMake( 80.5, 174)];
    [path0 addLineToPoint:CGPointMake( 81, 167)];
    [path0 addLineToPoint:CGPointMake( 83.5, 154.5)];
    [path0 addLineToPoint:CGPointMake( 87, 144)];
    [path0 addLineToPoint:CGPointMake( 91.5, 132.5)];
    [path0 addLineToPoint:CGPointMake( 97, 124)];
    [path0 addLineToPoint:CGPointMake( 104, 114.5)];
    [path0 addLineToPoint:CGPointMake( 112, 107)];
    [path0 addLineToPoint:CGPointMake( 120, 101.5)];
    [path0 addLineToPoint:CGPointMake( 128.5, 96.5)];
    [path0 addCurveToPoint:CGPointMake(140, 91.5) controlPoint1: CGPointMake(132.17, 95) controlPoint2: CGPointMake(139.6, 91.9)];
    [path0 addCurveToPoint:CGPointMake(151, 88) controlPoint1: CGPointMake(140.4, 91.1) controlPoint2: CGPointMake(147.5, 89)];
    [path0 addLineToPoint:CGPointMake( 167.5, 86.5)];
    [path0 addLineToPoint:CGPointMake( 181.5, 87.5)];
    [path0 addLineToPoint:CGPointMake( 195.5, 90)];
    [path0 addLineToPoint:CGPointMake( 208, 95)];
    [path0 addLineToPoint:CGPointMake( 220, 102.5)];
    [path0 addLineToPoint:CGPointMake( 228.5, 109.5)];
    [path0 addLineToPoint:CGPointMake( 235.5, 116.5)];
    [path0 addLineToPoint:CGPointMake( 241.5, 123.5)];
    [path0 moveToPoint:CGPointMake( 80.5, 174)];
    [path0 addLineToPoint:CGPointMake( 81.5, 188)];
    [path0 moveToPoint:CGPointMake( 241.5, 123.5)];
    [path0 addLineToPoint:CGPointMake( 250.5, 122)];
    [path0 addLineToPoint:CGPointMake( 262.5, 121.5)];
    [path0 addLineToPoint:CGPointMake( 274, 123)];
    [path0 addLineToPoint:CGPointMake( 284.5, 127)];
    [path0 addLineToPoint:CGPointMake( 291.5, 132.5)];
    [path0 addLineToPoint:CGPointMake( 294, 140)];
    [path0 addLineToPoint:CGPointMake( 293.5, 149)];
    [path0 addLineToPoint:CGPointMake( 290, 157.5)];
    [path0 addLineToPoint:CGPointMake( 279.5, 171)];
    [path0 addLineToPoint:CGPointMake( 271, 179.5)];
    [path0 addLineToPoint:CGPointMake( 258, 189.5)];
    [path0 addLineToPoint:CGPointMake( 254.67, 191.5)];
    [path0 moveToPoint:CGPointMake( 241.5, 123.5)];
    [path0 addLineToPoint:CGPointMake( 245, 128.5)];
    [path0 addLineToPoint:CGPointMake( 248, 135)];
    [path0 moveToPoint:CGPointMake( 81.5, 188)];
    [path0 addLineToPoint:CGPointMake( 77.5, 190.5)];
    [path0 addLineToPoint:CGPointMake( 74, 195)];
    [path0 addLineToPoint:CGPointMake( 72.5, 200)];
    [path0 addLineToPoint:CGPointMake( 73, 205)];
    [path0 addLineToPoint:CGPointMake( 75.5, 209)];
    [path0 addLineToPoint:CGPointMake( 80.5, 212)];
    [path0 addLineToPoint:CGPointMake( 88, 215)];
    [path0 addLineToPoint:CGPointMake( 90.5, 215.47)];
    [path0 moveToPoint:CGPointMake( 81.5, 188)];
    [path0 addLineToPoint:CGPointMake( 84, 196.5)];
    [path0 addLineToPoint:CGPointMake( 86.5, 205)];
    [path0 addLineToPoint:CGPointMake( 90.5, 215.47)];
    [path0 moveToPoint:CGPointMake( 248, 135)];
    [path0 addLineToPoint:CGPointMake( 262.5, 138)];
    [path0 addLineToPoint:CGPointMake( 265.5, 142)];
    [path0 addLineToPoint:CGPointMake( 266, 148)];
    [path0 addLineToPoint:CGPointMake( 264.5, 153.5)];
    [path0 addLineToPoint:CGPointMake( 260.5, 159)];
    [path0 addLineToPoint:CGPointMake( 256.83, 163)];
    [path0 moveToPoint:CGPointMake( 248, 135)];
    [path0 addLineToPoint:CGPointMake( 251, 142)];
    [path0 addLineToPoint:CGPointMake( 254.67, 153.5)];
    [path0 addLineToPoint:CGPointMake( 256.83, 163)];
    [path0 moveToPoint:CGPointMake( 108.5, 237.3)];
    [path0 addLineToPoint:CGPointMake( 118.5, 237)];
    [path0 addLineToPoint:CGPointMake( 139.5, 234.5)];
    [path0 addLineToPoint:CGPointMake( 157, 231)];
    [path0 addLineToPoint:CGPointMake( 172.5, 227)];
    [path0 addLineToPoint:CGPointMake( 192, 221)];
    [path0 addLineToPoint:CGPointMake( 211.5, 213.5)];
    [path0 addLineToPoint:CGPointMake( 227, 206.5)];
    [path0 addLineToPoint:CGPointMake( 243, 198.5)];
    [path0 addLineToPoint:CGPointMake( 254.67, 191.5)];
    [path0 moveToPoint:CGPointMake( 108.5, 237.3)];
    [path0 addLineToPoint:CGPointMake( 113.5, 243)];
    [path0 addLineToPoint:CGPointMake( 121.5, 249)];
    [path0 addLineToPoint:CGPointMake( 130.5, 253.5)];
    [path0 addLineToPoint:CGPointMake( 139.5, 257)];
    [path0 addLineToPoint:CGPointMake( 150.5, 260.5)];
    [path0 addLineToPoint:CGPointMake( 163, 262.5)];
    [path0 addLineToPoint:CGPointMake( 186, 261.5)];
    [path0 addLineToPoint:CGPointMake( 195.5, 259)];
    [path0 addLineToPoint:CGPointMake( 203, 256)];
    [path0 addLineToPoint:CGPointMake( 212.5, 251.5)];
    [path0 addLineToPoint:CGPointMake( 220, 246.5)];
    [path0 addLineToPoint:CGPointMake( 226, 242)];
    [path0 addLineToPoint:CGPointMake( 234, 233.5)];
    [path0 addLineToPoint:CGPointMake( 242, 223.5)];
    [path0 addLineToPoint:CGPointMake( 247.5, 214)];
    [path0 addLineToPoint:CGPointMake( 252.5, 202)];
    [path0 addLineToPoint:CGPointMake( 254.67, 191.5)];
    [path0 moveToPoint:CGPointMake( 256.83, 163)];
    [path0 addLineToPoint:CGPointMake( 255, 165)];
    [path0 addLineToPoint:CGPointMake( 250, 170)];
    [path0 addLineToPoint:CGPointMake( 244, 174.5)];
    [path0 addLineToPoint:CGPointMake( 236.5, 179.5)];
    [path0 addLineToPoint:CGPointMake( 229.5, 184)];
    [path0 addLineToPoint:CGPointMake( 222.5, 188)];
    [path0 addLineToPoint:CGPointMake( 215.5, 191.5)];
    [path0 addLineToPoint:CGPointMake( 206.5, 196)];
    [path0 addLineToPoint:CGPointMake( 195, 201)];
    [path0 addLineToPoint:CGPointMake( 183.5, 205)];
    [path0 addLineToPoint:CGPointMake( 171.5, 208.5)];
    [path0 addLineToPoint:CGPointMake( 160, 211.5)];
    [path0 addLineToPoint:CGPointMake( 148, 214)];
    [path0 addLineToPoint:CGPointMake( 136, 216)];
    [path0 addLineToPoint:CGPointMake( 124, 217)];
    [path0 addLineToPoint:CGPointMake( 112.5, 217.5)];
    [path0 addLineToPoint:CGPointMake( 103.5, 217)];
    [path0 addLineToPoint:CGPointMake( 96, 216.5)];
    [path0 addLineToPoint:CGPointMake( 90.5, 215.47)];

    // path1 lines on planet
    UIBezierPath * path1 = [UIBezierPath bezierPath];

    [path1 moveToPoint:CGPointMake( 176, 134.5)];
    [path1 addLineToPoint:CGPointMake( 182, 131.5)];
    [path1 addLineToPoint:CGPointMake( 191.5, 126)];
    [path1 addLineToPoint:CGPointMake( 201, 119)];
    [path1 addLineToPoint:CGPointMake( 207.5, 112)];
    [path1 addLineToPoint:CGPointMake( 211.5, 105)];
    [path1 addLineToPoint:CGPointMake( 214, 99)];
    [path1 moveToPoint:CGPointMake( 129.5, 113)];
    [path1 addLineToPoint:CGPointMake( 122.5, 112.5)];
    [path1 addLineToPoint:CGPointMake( 116.5, 110.5)];
    [path1 addLineToPoint:CGPointMake( 111.5, 107.5)];
    [path1 moveToPoint:CGPointMake( 140, 111.5)];
    [path1 addLineToPoint:CGPointMake( 147.5, 109.5)];
    [path1 addLineToPoint:CGPointMake( 155.5, 107)];
    [path1 addLineToPoint:CGPointMake( 163.5, 102.5)];
    [path1 addCurveToPoint:CGPointMake(171, 97) controlPoint1: CGPointMake(165.83, 100.83) controlPoint2: CGPointMake(170.6, 97.4)];
    [path1 addCurveToPoint:CGPointMake(175.5, 92) controlPoint1: CGPointMake(171.4, 96.6) controlPoint2: CGPointMake(174.17, 93.5)];
    [path1 addLineToPoint:CGPointMake( 177.5, 87.5)];
    [path1 moveToPoint:CGPointMake( 117.5, 128.5)];
    [path1 addLineToPoint:CGPointMake( 122, 129.5)];
    [path1 addLineToPoint:CGPointMake( 137.5, 128.5)];
    [path1 addLineToPoint:CGPointMake( 144.5, 127)];
    [path1 addLineToPoint:CGPointMake( 153, 125)];
    [path1 moveToPoint:CGPointMake( 123, 148)];
    [path1 addCurveToPoint:CGPointMake(127, 147.5) controlPoint1: CGPointMake(123.4, 148) controlPoint2: CGPointMake(125.83, 147.67)];
    [path1 addLineToPoint:CGPointMake( 131.5, 147)];
    [path1 addLineToPoint:CGPointMake( 135.5, 146)];
    [path1 moveToPoint:CGPointMake( 114.5, 147.5)];
    [path1 addLineToPoint:CGPointMake( 107, 147)];
    [path1 addLineToPoint:CGPointMake( 100, 144.5)];
    [path1 addCurveToPoint:CGPointMake(93.5, 141.5) controlPoint1: CGPointMake(98, 143.5) controlPoint2: CGPointMake(93.9, 141.5)];
    [path1 addCurveToPoint:CGPointMake(89, 139) controlPoint1: CGPointMake(93.1, 141.5) controlPoint2: CGPointMake(90.33, 139.83)];
    [path1 moveToPoint:CGPointMake( 106.5, 186.5)];
    [path1 addLineToPoint:CGPointMake( 98.5, 185)];
    [path1 addLineToPoint:CGPointMake( 89.5, 181.5)];
    [path1 addLineToPoint:CGPointMake( 80.5, 176)];
    [path1 moveToPoint:CGPointMake( 126.5, 186.5)];
    [path1 addLineToPoint:CGPointMake( 136.5, 186)];
    [path1 addLineToPoint:CGPointMake( 145.5, 184.5)];
    [path1 addLineToPoint:CGPointMake( 156, 182)];
    [path1 addLineToPoint:CGPointMake( 165.5, 179.5)];
    [path1 addLineToPoint:CGPointMake( 175, 176.5)];
    [path1 addLineToPoint:CGPointMake( 184.5, 173.5)];
    [path1 addLineToPoint:CGPointMake( 194.5, 169)];
    [path1 addLineToPoint:CGPointMake( 204, 164.5)];
    [path1 addLineToPoint:CGPointMake( 212, 159.5)];
    [path1 addLineToPoint:CGPointMake( 218, 155.5)];
    [path1 addLineToPoint:CGPointMake( 223.5, 152)];
    [path1 moveToPoint:CGPointMake( 232, 144)];
    [path1 addLineToPoint:CGPointMake( 236, 139)];
    [path1 addLineToPoint:CGPointMake( 239.5, 133)];
    [path1 addLineToPoint:CGPointMake( 242.5, 125.5)];
    [path1 moveToPoint:CGPointMake( 145.5, 165)];
    [path1 addLineToPoint:CGPointMake( 153.5, 163)];
    [path1 addLineToPoint:CGPointMake( 166.5, 159)];
    [path1 addLineToPoint:CGPointMake( 175, 156)];
    [path1 addLineToPoint:CGPointMake( 184, 152)];
    [path1 addLineToPoint:CGPointMake( 191.5, 148.5)];
    [path1 addLineToPoint:CGPointMake( 198, 145)];
    [path1 moveToPoint:CGPointMake( 106.5, 204)];
    [path1 addLineToPoint:CGPointMake( 113.5, 204.5)];
    [path1 addLineToPoint:CGPointMake( 129, 203.5)];
    [path1 moveToPoint:CGPointMake( 210.5, 179.5)];
    [path1 addLineToPoint:CGPointMake( 216.5, 177.5)];
    [path1 addLineToPoint:CGPointMake( 224, 173)];
    [path1 addLineToPoint:CGPointMake( 233, 166)];
    [path1 addLineToPoint:CGPointMake( 239, 161.5)];
    [path1 addLineToPoint:CGPointMake( 243, 157)];
    [path1 moveToPoint:CGPointMake( 187, 233.5)];
    [path1 addLineToPoint:CGPointMake( 191.5, 232.5)];
    [path1 addLineToPoint:CGPointMake( 200.5, 229)];
    [path1 addLineToPoint:CGPointMake( 208.5, 225.5)];
    [path1 addLineToPoint:CGPointMake( 215, 222.5)];
    [path1 addLineToPoint:CGPointMake( 221, 219.5)];
    [path1 addLineToPoint:CGPointMake( 223.5, 216.5)];
    [path1 moveToPoint:CGPointMake( 228.5, 229)];
    [path1 addLineToPoint:CGPointMake( 234.5, 225.5)];
    [path1 addLineToPoint:CGPointMake( 240, 221.5)];
    [path1 addLineToPoint:CGPointMake( 247.5, 214)];
    [path1 moveToPoint:CGPointMake( 218, 235)];
    [path1 addLineToPoint:CGPointMake( 210.5, 238.5)];
    [path1 addLineToPoint:CGPointMake( 200, 242.5)];
    [path1 addLineToPoint:CGPointMake( 190, 246)];
    [path1 addLineToPoint:CGPointMake( 179, 249)];
    [path1 addLineToPoint:CGPointMake( 168.5, 251.5)];
    [path1 addLineToPoint:CGPointMake( 154.5, 253)];
    [path1 addLineToPoint:CGPointMake( 141, 253.5)];
    [path1 addLineToPoint:CGPointMake( 129.5, 253)];

    // path2 asteroids
    UIBezierPath * path2 = [UIBezierPath bezierPath];

    [path2 moveToPoint:CGPointMake( 272.5, 201)];
    [path2 addLineToPoint:CGPointMake( 277.5, 197.5)];
    [path2 addLineToPoint:CGPointMake( 284.5, 198)];
    [path2 addLineToPoint:CGPointMake( 289, 201.5)];
    [path2 addLineToPoint:CGPointMake( 290.5, 206.5)];
    [path2 addLineToPoint:CGPointMake( 289.5, 211)];
    [path2 addLineToPoint:CGPointMake( 286.5, 215.5)];
    [path2 addLineToPoint:CGPointMake( 281.5, 217)];
    [path2 addLineToPoint:CGPointMake( 275.5, 216)];
    [path2 addLineToPoint:CGPointMake( 271.5, 212)];
    [path2 addLineToPoint:CGPointMake( 270, 207)];
    [path2 addLineToPoint:CGPointMake( 272.5, 201)];
    [path2 closePath];
    [path2 moveToPoint:CGPointMake( 260, 231)];
    [path2 addLineToPoint:CGPointMake( 262, 229)];
    [path2 addLineToPoint:CGPointMake( 266.5, 230.5)];
    [path2 addLineToPoint:CGPointMake( 267, 233)];
    [path2 addLineToPoint:CGPointMake( 266, 235)];
    [path2 addLineToPoint:CGPointMake( 263.5, 236)];
    [path2 addLineToPoint:CGPointMake( 261, 235.5)];
    [path2 addLineToPoint:CGPointMake( 259.5, 233.5)];
    [path2 addLineToPoint:CGPointMake( 260, 231)];
    [path2 closePath];
    [path2 moveToPoint:CGPointMake( 94.5, 262)];
    [path2 addLineToPoint:CGPointMake( 96.5, 261)];
    [path2 addLineToPoint:CGPointMake( 99.5, 262)];
    [path2 addCurveToPoint:CGPointMake(101, 264.5) controlPoint1: CGPointMake(100, 262.67) controlPoint2: CGPointMake(101, 264.1)];
    [path2 addCurveToPoint:CGPointMake(101, 267.5) controlPoint1: CGPointMake(101, 264.9) controlPoint2: CGPointMake(101.17, 266.83)];
    [path2 addLineToPoint:CGPointMake( 98.5, 269)];
    [path2 addLineToPoint:CGPointMake( 93.5, 267)];
    [path2 addLineToPoint:CGPointMake( 93, 264.5)];
    [path2 addLineToPoint:CGPointMake( 94.5, 262)];
    [path2 closePath];
    [path2 moveToPoint:CGPointMake( 55.5, 96.5)];
    [path2 addCurveToPoint:CGPointMake(61.5, 92) controlPoint1: CGPointMake(57.33, 95) controlPoint2: CGPointMake(61.1, 92)];
    [path2 addLineToPoint:CGPointMake( 68, 91)];
    [path2 addLineToPoint:CGPointMake( 74.5, 93)];
    [path2 addLineToPoint:CGPointMake( 80.5, 100)];
    [path2 addLineToPoint:CGPointMake( 81, 109.5)];
    [path2 addLineToPoint:CGPointMake( 77, 117)];
    [path2 addLineToPoint:CGPointMake( 68.5, 121)];
    [path2 addLineToPoint:CGPointMake( 59.5, 119)];
    [path2 addLineToPoint:CGPointMake( 53.5, 114.5)];
    [path2 addLineToPoint:CGPointMake( 51.5, 105.5)];
    [path2 addLineToPoint:CGPointMake( 55.5, 96.5)];
    [path2 closePath];
    [path2 moveToPoint:CGPointMake( 237, 71)];
    [path2 addCurveToPoint:CGPointMake(242.5, 70) controlPoint1: CGPointMake(238, 70.67) controlPoint2: CGPointMake(242.1, 70)];
    [path2 addLineToPoint:CGPointMake( 247, 73)];
    [path2 addLineToPoint:CGPointMake( 247.5, 78)];
    [path2 addLineToPoint:CGPointMake( 245.5, 82)];
    [path2 addLineToPoint:CGPointMake( 240.5, 83.5)];
    [path2 addLineToPoint:CGPointMake( 235.5, 81)];
    [path2 addLineToPoint:CGPointMake( 234, 75.5)];
    [path2 addLineToPoint:CGPointMake( 237, 71)];
    [path2 closePath];

    // MARK: - drawing parameters
    
    [_layer0 setLineWidth:2];
    [_layer0 setPath:path0.CGPath];
    [_layer0 setStrokeColor:color0.CGColor];
    [_layer0 setFillColor:nil];
    [_layer0 setStrokeStart:0.0];
    [_layer0 setStrokeEnd:0.0];
    [self.layer addSublayer:_layer0];

    [_layer1 setPath:path1.CGPath];
    [_layer1 setStrokeColor:color1.CGColor];
    [_layer1 setFillColor:nil];
    [_layer1 setStrokeStart:0.0];
    [_layer1 setStrokeEnd:0.0];
    [self.layer addSublayer:_layer1];

    [_layer2 setPath:path2.CGPath];
    [_layer2 setStrokeColor:color2.CGColor];
    [_layer2 setFillColor:nil];
    [_layer2 setStrokeStart:0.0];
    [_layer2 setStrokeEnd:0.0];
    [self.layer addSublayer:_layer2];

    [self clearsContextBeforeDrawing];
    [self.layer setNeedsLayout]; // мб поможет обновлять лэер в будущем.
    
} // drawPlanet

// MARK: - drawLanscape
- (void)drawLandscape:(UIColor*)color0 :(UIColor*)color1 :(UIColor*)color2 {
    [self reset];
    
    _layer0 = [CAShapeLayer layer];
    _layer1 = [CAShapeLayer layer];
    _layer2 = [CAShapeLayer layer];
    
    
    _layer0.bounds = CGRectMake(-150, -150, 340, 340);
    _layer1.bounds = CGRectMake(-150, -150, 340, 340);
    _layer2.bounds = CGRectMake(-150, -150, 340, 340);
  
//    // path3
    UIBezierPath * path0 = [UIBezierPath bezierPath];
    [path0 moveToPoint:CGPointMake( 269, 154)];
    [path0 addLineToPoint:CGPointMake( 275.5, 163.5)];
    [path0 addLineToPoint:CGPointMake( 288, 176)];
    [path0 addLineToPoint:CGPointMake( 287, 159.5)];
    [path0 addLineToPoint:CGPointMake( 284.5, 144)];
    [path0 addLineToPoint:CGPointMake( 279.5, 130.5)];
    [path0 addLineToPoint:CGPointMake( 275.5, 122)];
    [path0 addLineToPoint:CGPointMake( 271.5, 114.5)];
    [path0 addLineToPoint:CGPointMake( 265.5, 106)];
    [path0 addLineToPoint:CGPointMake( 260.5, 105.5)];
    [path0 addLineToPoint:CGPointMake( 254, 106)];
    [path0 addLineToPoint:CGPointMake( 250, 107.5)];
    [path0 addLineToPoint:CGPointMake( 246.5, 105.5)];
    [path0 addLineToPoint:CGPointMake( 243.5, 104.5)];
    [path0 addLineToPoint:CGPointMake( 239.5, 105.5)];
    [path0 addLineToPoint:CGPointMake( 230, 107.5)];
    [path0 addLineToPoint:CGPointMake( 227, 106)];
    [path0 addLineToPoint:CGPointMake( 223, 104.5)];
    [path0 addLineToPoint:CGPointMake( 202.5, 106)];
    [path0 addLineToPoint:CGPointMake( 196, 104.5)];
    [path0 addLineToPoint:CGPointMake( 186, 103.5)];
    [path0 addLineToPoint:CGPointMake( 180.5, 105.5)];
    [path0 addLineToPoint:CGPointMake( 177, 103.5)];
    [path0 addLineToPoint:CGPointMake( 175.5, 102)];
    [path0 addLineToPoint:CGPointMake( 179, 99)];
    [path0 addLineToPoint:CGPointMake( 180.5, 97)];
    [path0 addLineToPoint:CGPointMake( 183.5, 94.5)];
    [path0 addLineToPoint:CGPointMake( 186, 91)];
    [path0 addLineToPoint:CGPointMake( 208, 88)];
    [path0 addLineToPoint:CGPointMake( 210, 84)];
    [path0 addLineToPoint:CGPointMake( 216.5, 83)];
    [path0 addLineToPoint:CGPointMake( 220, 85.5)];
    [path0 addLineToPoint:CGPointMake( 224, 84)];
    [path0 addLineToPoint:CGPointMake( 228, 85.5)];
    [path0 addLineToPoint:CGPointMake( 230, 81.5)];
    [path0 addLineToPoint:CGPointMake( 234.5, 79.5)];
    [path0 addLineToPoint:CGPointMake( 230, 72)];
    [path0 addLineToPoint:CGPointMake( 216.5, 64.5)];
    [path0 addLineToPoint:CGPointMake( 199, 57.5)];
    [path0 addLineToPoint:CGPointMake( 179, 53.5)];
    [path0 addLineToPoint:CGPointMake( 163.5, 52.5)];
    [path0 addLineToPoint:CGPointMake( 146.5, 53.5)];
    [path0 addLineToPoint:CGPointMake( 130, 56)];
    [path0 addLineToPoint:CGPointMake( 117, 61)];
    [path0 addLineToPoint:CGPointMake( 105.5, 66)];
    [path0 addLineToPoint:CGPointMake( 111, 69)];
    [path0 addLineToPoint:CGPointMake( 115, 73)];
    [path0 addLineToPoint:CGPointMake( 118, 78.5)];
    [path0 addLineToPoint:CGPointMake( 118.5, 84)];
    [path0 addLineToPoint:CGPointMake( 115, 92)];
    [path0 addLineToPoint:CGPointMake( 109.5, 97)];
    [path0 addLineToPoint:CGPointMake( 105.5, 99)];
    [path0 addLineToPoint:CGPointMake( 94, 96)];
    [path0 addLineToPoint:CGPointMake( 89, 92)];
    [path0 addLineToPoint:CGPointMake( 85.5, 85.5)];
    [path0 addLineToPoint:CGPointMake( 73, 90.5)];
    [path0 addLineToPoint:CGPointMake( 64.5, 100.5)];
    [path0 addLineToPoint:CGPointMake( 57, 112)];
    [path0 addLineToPoint:CGPointMake( 51.5, 123)];
    [path0 addLineToPoint:CGPointMake( 50, 129)];
    [path0 addLineToPoint:CGPointMake( 57, 128)];
    [path0 addLineToPoint:CGPointMake( 63.5, 132)];
    [path0 addLineToPoint:CGPointMake( 75.5, 137)];
    [path0 addLineToPoint:CGPointMake( 79, 136)];
    [path0 addLineToPoint:CGPointMake( 84, 138.5)];
    [path0 addLineToPoint:CGPointMake( 81.5, 139.5)];
    [path0 addLineToPoint:CGPointMake( 75.5, 141)];
    [path0 addLineToPoint:CGPointMake( 70.5, 140)];
    [path0 addLineToPoint:CGPointMake( 68.5, 141)];
    [path0 addLineToPoint:CGPointMake( 59.5, 143)];
    [path0 addLineToPoint:CGPointMake( 57.5, 142)];
    [path0 addLineToPoint:CGPointMake( 50, 139.5)];
    [path0 addLineToPoint:CGPointMake( 44.5, 142)];
    [path0 addLineToPoint:CGPointMake( 42, 150.5)];
    [path0 addLineToPoint:CGPointMake( 40, 176.5)];
    [path0 addLineToPoint:CGPointMake( 44.5, 206.5)];
    [path0 addLineToPoint:CGPointMake( 51.5, 199.5)];
    [path0 addLineToPoint:CGPointMake( 57, 195.5)];
    [path0 addLineToPoint:CGPointMake( 68.5, 183)];
    [path0 addLineToPoint:CGPointMake( 79, 171.5)];
    [path0 moveToPoint:CGPointMake( 269, 154)];
    [path0 addLineToPoint:CGPointMake( 258, 159.5)];
    [path0 moveToPoint:CGPointMake( 269, 154)];
    [path0 addLineToPoint:CGPointMake( 267.17, 163.5)];
    [path0 moveToPoint:CGPointMake( 258, 159.5)];
    [path0 addLineToPoint:CGPointMake( 246.5, 136)];
    [path0 addLineToPoint:CGPointMake( 238, 128.5)];
    [path0 addLineToPoint:CGPointMake( 230, 138.5)];
    [path0 addLineToPoint:CGPointMake( 219, 151)];
    [path0 addLineToPoint:CGPointMake( 214.5, 148.5)];
    [path0 addLineToPoint:CGPointMake( 197.5, 166.5)];
    [path0 addLineToPoint:CGPointMake( 183.5, 187)];
    [path0 moveToPoint:CGPointMake( 258, 159.5)];
    [path0 addLineToPoint:CGPointMake( 262, 166.5)];
    [path0 addLineToPoint:CGPointMake( 267.17, 175)];
    [path0 moveToPoint:CGPointMake( 183.5, 187)];
    [path0 addLineToPoint:CGPointMake( 175.5, 178)];
    [path0 addLineToPoint:CGPointMake( 155, 158)];
    [path0 addLineToPoint:CGPointMake( 147.5, 138.5)];
    [path0 addLineToPoint:CGPointMake( 136.5, 128.5)];
    [path0 moveToPoint:CGPointMake( 183.5, 187)];
    [path0 addLineToPoint:CGPointMake( 187, 193)];
    [path0 addLineToPoint:CGPointMake( 194.25, 200.25)];
    [path0 moveToPoint:CGPointMake( 136.5, 128.5)];
    [path0 addLineToPoint:CGPointMake( 125, 137)];
    [path0 addLineToPoint:CGPointMake( 121.5, 144)];
    [path0 addLineToPoint:CGPointMake( 110.5, 156.5)];
    [path0 addLineToPoint:CGPointMake( 104.5, 154)];
    [path0 moveToPoint:CGPointMake( 136.5, 128.5)];
    [path0 addLineToPoint:CGPointMake( 132.5, 136)];
    [path0 addLineToPoint:CGPointMake( 131, 144)];
    [path0 moveToPoint:CGPointMake( 104.5, 154)];
    [path0 addLineToPoint:CGPointMake( 89, 174)];
    [path0 addLineToPoint:CGPointMake( 79, 171.5)];
    [path0 moveToPoint:CGPointMake( 104.5, 154)];
    [path0 addLineToPoint:CGPointMake( 106.5, 178)];
    [path0 moveToPoint:CGPointMake( 79, 171.5)];
    [path0 addLineToPoint:CGPointMake( 82.5, 177.5)];
    [path0 addLineToPoint:CGPointMake( 84, 184.5)];
    [path0 addLineToPoint:CGPointMake( 89, 203.5)];
    [path0 moveToPoint:CGPointMake( 201.5, 207.5)];
    [path0 addLineToPoint:CGPointMake( 194.25, 200.25)];
    [path0 moveToPoint:CGPointMake( 278.5, 195)];
    [path0 addLineToPoint:CGPointMake( 269, 178)];
    [path0 addLineToPoint:CGPointMake( 267.17, 175)];
    [path0 moveToPoint:CGPointMake( 194.25, 200.25)];
    [path0 addLineToPoint:CGPointMake( 208, 195.5)];
    [path0 addLineToPoint:CGPointMake( 209.16, 197)];
    [path0 moveToPoint:CGPointMake( 216.5, 206.5)];
    [path0 addLineToPoint:CGPointMake( 209.16, 197)];
    [path0 moveToPoint:CGPointMake( 209.16, 197)];
    [path0 addLineToPoint:CGPointMake( 216.5, 194)];
    [path0 addLineToPoint:CGPointMake( 223, 197)];
    [path0 addLineToPoint:CGPointMake( 233, 203.5)];
    [path0 addLineToPoint:CGPointMake( 243.5, 207.5)];
    [path0 addLineToPoint:CGPointMake( 252, 214.5)];
    [path0 addLineToPoint:CGPointMake( 258, 216)];
    [path0 addLineToPoint:CGPointMake( 273.5, 228)];
    [path0 moveToPoint:CGPointMake( 128, 169)];
    [path0 addLineToPoint:CGPointMake( 129.5, 151)];

    // path4
    UIBezierPath * path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:CGPointMake( 55.5, 233.5)];
    [path1 addLineToPoint:CGPointMake( 84, 230)];
    [path1 addLineToPoint:CGPointMake( 101.5, 220.5)];
    [path1 addLineToPoint:CGPointMake( 118.5, 215.5)];
    [path1 addLineToPoint:CGPointMake( 134.5, 222)];
    [path1 addLineToPoint:CGPointMake( 147.25, 227.75)];
    [path1 moveToPoint:CGPointMake( 160, 233.5)];
    [path1 addLineToPoint:CGPointMake( 147.25, 227.75)];
    [path1 moveToPoint:CGPointMake( 147.25, 227.75)];
    [path1 addLineToPoint:CGPointMake( 160, 224)];
    [path1 addLineToPoint:CGPointMake( 170, 225.5)];
    [path1 addLineToPoint:CGPointMake( 179.5, 227.75)];
    [path1 addLineToPoint:CGPointMake( 193, 230)];
    [path1 addLineToPoint:CGPointMake( 215, 237.5)];
    [path1 moveToPoint:CGPointMake( 205.5, 240)];
    [path1 addLineToPoint:CGPointMake( 218, 237.5)];
    [path1 addLineToPoint:CGPointMake( 228.5, 232)];
    [path1 addLineToPoint:CGPointMake( 277, 227.75)];
    [path1 moveToPoint:CGPointMake( 76.5, 261.5)];
    [path1 addLineToPoint:CGPointMake( 107.5, 258)];
    [path1 addLineToPoint:CGPointMake( 124.5, 261.5)];
    [path1 addLineToPoint:CGPointMake( 149, 264.5)];
    [path1 addLineToPoint:CGPointMake( 193, 269)];
    [path1 moveToPoint:CGPointMake( 160, 278.5)];
    [path1 addLineToPoint:CGPointMake( 183.5, 272.5)];
    [path1 addLineToPoint:CGPointMake( 205.5, 261.5)];
    [path1 addLineToPoint:CGPointMake( 218, 255)];
    [path1 moveToPoint:CGPointMake( 106, 285)];
    [path1 addLineToPoint:CGPointMake( 118.5, 282.5)];
    [path1 addLineToPoint:CGPointMake( 143, 285)];
    [path1 addLineToPoint:CGPointMake( 171, 286)];
    [path1 addLineToPoint:CGPointMake( 215, 278.5)];
    [path1 addLineToPoint:CGPointMake( 238, 276)];

    // path5
    UIBezierPath * path2 = [UIBezierPath bezierPath];

    [path2 moveToPoint:CGPointMake( 123.5, 173)];
    [path2 addLineToPoint:CGPointMake( 125.5, 179.5)];
    [path2 addLineToPoint:CGPointMake( 126.5, 190.5)];
    [path2 addLineToPoint:CGPointMake( 124, 209)];
    [path2 addLineToPoint:CGPointMake( 120.5, 226.5)];
    [path2 addLineToPoint:CGPointMake( 121, 236)];
    [path2 addLineToPoint:CGPointMake( 124, 244)];
    [path2 moveToPoint:CGPointMake( 128.5, 244)];
    [path2 addLineToPoint:CGPointMake( 129.5, 232.5)];
    [path2 moveToPoint:CGPointMake( 130.5, 228.5)];
    [path2 addLineToPoint:CGPointMake( 129.5, 216.5)];
    [path2 addLineToPoint:CGPointMake( 128.5, 208.5)];
    [path2 addLineToPoint:CGPointMake( 127.5, 201)];
    [path2 moveToPoint:CGPointMake( 136, 195.5)];
    [path2 addLineToPoint:CGPointMake( 138, 203.5)];
    [path2 addLineToPoint:CGPointMake( 139.5, 214)];
    [path2 moveToPoint:CGPointMake( 141, 204.5)];
    [path2 addLineToPoint:CGPointMake( 141.5, 210.5)];
    [path2 addLineToPoint:CGPointMake( 144, 219.5)];
    [path2 addLineToPoint:CGPointMake( 146.5, 225.5)];
    [path2 moveToPoint:CGPointMake( 145, 214)];
    [path2 addLineToPoint:CGPointMake( 145.5, 218.5)];
    [path2 addLineToPoint:CGPointMake( 149, 224.5)];
    [path2 moveToPoint:CGPointMake( 158, 202)];
    [path2 addLineToPoint:CGPointMake( 159, 209)];
    [path2 addLineToPoint:CGPointMake( 160.5, 216)];
    [path2 addLineToPoint:CGPointMake( 163, 221.5)];
    [path2 moveToPoint:CGPointMake( 166.5, 223)];
    [path2 addLineToPoint:CGPointMake( 163.5, 217)];
    [path2 addLineToPoint:CGPointMake( 162, 212)];
    [path2 addLineToPoint:CGPointMake( 161.5, 207)];
    [path2 moveToPoint:CGPointMake( 159, 216)];
    [path2 addLineToPoint:CGPointMake( 157, 210)];
    [path2 addLineToPoint:CGPointMake( 156, 204)];
    [path2 addLineToPoint:CGPointMake( 155.5, 196)];
    [path2 addLineToPoint:CGPointMake( 156, 189)];
    [path2 moveToPoint:CGPointMake( 99, 178.5)];
    [path2 addLineToPoint:CGPointMake( 96.5, 186)];
    [path2 addLineToPoint:CGPointMake( 95.5, 193)];
    [path2 moveToPoint:CGPointMake( 93.5, 195.5)];
    [path2 addLineToPoint:CGPointMake( 94, 187.5)];
    [path2 addLineToPoint:CGPointMake( 96.5, 178.5)];
    [path2 addLineToPoint:CGPointMake( 100, 171)];
    [path2 moveToPoint:CGPointMake( 102.5, 160)];
    [path2 addLineToPoint:CGPointMake( 98.5, 166)];
    [path2 addLineToPoint:CGPointMake( 95.5, 172)];
    [path2 moveToPoint:CGPointMake( 58.5, 201)];
    [path2 addLineToPoint:CGPointMake( 56.5, 209)];
    [path2 addLineToPoint:CGPointMake( 53.5, 216.5)];
    [path2 addLineToPoint:CGPointMake( 50.5, 222)];
    [path2 moveToPoint:CGPointMake( 61.5, 201)];
    [path2 addLineToPoint:CGPointMake( 59.5, 208.5)];
    [path2 addLineToPoint:CGPointMake( 56, 217.5)];
    [path2 moveToPoint:CGPointMake( 63, 193)];
    [path2 addLineToPoint:CGPointMake( 62, 198.5)];
    [path2 moveToPoint:CGPointMake( 76.5, 179.5)];
    [path2 addLineToPoint:CGPointMake( 74, 189)];
    [path2 moveToPoint:CGPointMake( 75.5, 192)];
    [path2 addLineToPoint:CGPointMake( 74, 198.5)];
    [path2 addLineToPoint:CGPointMake( 73.5, 206)];
    [path2 moveToPoint:CGPointMake( 72.5, 194.5)];
    [path2 addLineToPoint:CGPointMake( 71.5, 204)];
    [path2 moveToPoint:CGPointMake( 82.5, 207)];
    [path2 addLineToPoint:CGPointMake( 83, 213)];
    [path2 moveToPoint:CGPointMake( 84.5, 214)];
    [path2 moveToPoint:CGPointMake( 100, 194.5)];
    [path2 addLineToPoint:CGPointMake( 100.5, 205.5)];
    [path2 addLineToPoint:CGPointMake( 101.5, 214)];
    [path2 moveToPoint:CGPointMake( 211.5, 161)];
    [path2 addLineToPoint:CGPointMake( 212, 165.5)];
    [path2 addLineToPoint:CGPointMake( 214.5, 172)];
    [path2 addLineToPoint:CGPointMake( 215.04, 174.5)];
    [path2 moveToPoint:CGPointMake( 214.5, 186.5)];
    [path2 addLineToPoint:CGPointMake( 216, 179)];
    [path2 addLineToPoint:CGPointMake( 215.04, 174.5)];
    [path2 moveToPoint:CGPointMake( 216, 160.5)];
    [path2 addLineToPoint:CGPointMake( 215.5, 166.5)];
    [path2 addLineToPoint:CGPointMake( 215.04, 174.5)];
    [path2 moveToPoint:CGPointMake( 227.5, 153.5)];
    [path2 addLineToPoint:CGPointMake( 225.5, 161)];
    [path2 addLineToPoint:CGPointMake( 223.5, 168.5)];
    [path2 moveToPoint:CGPointMake( 246, 164)];
    [path2 addLineToPoint:CGPointMake( 247.5, 173.5)];
    [path2 addLineToPoint:CGPointMake( 253.5, 186.5)];
    [path2 moveToPoint:CGPointMake( 225.5, 208.5)];
    [path2 addLineToPoint:CGPointMake( 230, 216)];
    [path2 addLineToPoint:CGPointMake( 235, 221.5)];
    [path2 moveToPoint:CGPointMake( 223.5, 222)];
    [path2 addLineToPoint:CGPointMake( 218, 218.5)];
    [path2 moveToPoint:CGPointMake( 273.5, 171)];
    [path2 moveToPoint:CGPointMake( 278, 173.5)];
    [path2 addLineToPoint:CGPointMake( 280.5, 182.5)];
    [path2 moveToPoint:CGPointMake( 139.5, 156)];
    [path2 addLineToPoint:CGPointMake( 141.5, 165.5)];
    [path2 addLineToPoint:CGPointMake( 146.5, 168.5)];
    [path2 addLineToPoint:CGPointMake( 149, 174.5)];
    [path2 moveToPoint:CGPointMake( 239, 136.5)];
    [path2 addLineToPoint:CGPointMake( 241, 140)];
    [path2 moveToPoint:CGPointMake( 235, 142.5)];
    [path2 addLineToPoint:CGPointMake( 233.5, 152.5)];
    [path2 moveToPoint:CGPointMake( 243.5, 216)];
    [path2 addLineToPoint:CGPointMake( 246, 217.5)];
    [path2 addLineToPoint:CGPointMake( 251, 219.5)];
    [path2 addLineToPoint:CGPointMake( 259.5, 226.5)];
    [path2 moveToPoint:CGPointMake( 179.5, 194.5)];
    [path2 addLineToPoint:CGPointMake( 182, 201)];
    [path2 addLineToPoint:CGPointMake( 188.5, 208.5)];

    
    // MARK: drawing parameters
    
    [_layer0 setLineWidth:2];
    [_layer0 setPath:path0.CGPath];
    [_layer0 setStrokeColor:color0.CGColor];
    [_layer0 setFillColor:nil];
    [_layer0 setStrokeStart:0.0];
    [_layer0 setStrokeEnd:0.0];
    [self.layer addSublayer:_layer0];

    [_layer1 setPath:path1.CGPath];
    [_layer1 setStrokeColor:color1.CGColor];
    [_layer1 setFillColor:nil];
    [_layer1 setStrokeStart:0.0];
    [_layer1 setStrokeEnd:0.0];
    [self.layer addSublayer:_layer1];

    [_layer2 setPath:path2.CGPath];
    [_layer2 setStrokeColor:color2.CGColor];
    [_layer2 setFillColor:nil];
    [_layer2 setStrokeStart:0.0];
    [_layer2 setStrokeEnd:0.0];
    [self.layer addSublayer:_layer2];
    
    [self clearsContextBeforeDrawing];
    [self.layer setNeedsLayout]; // мб поможет обновлять лэер в будущем.

} // drawLandscape



// MARK: - drawTree
- (void)drawTree:(UIColor*)color0 :(UIColor*)color1 :(UIColor*)color2 {
    [self reset];
    
    _layer0 = [CAShapeLayer layer];
    _layer1 = [CAShapeLayer layer];
    _layer2 = [CAShapeLayer layer];
    
    
    _layer0.bounds = CGRectMake(-150, -150, 340, 340);
    _layer1.bounds = CGRectMake(-150, -150, 340, 340);
    _layer2.bounds = CGRectMake(-150, -150, 340, 340);

    // path0 крона дерева
    UIBezierPath * path0 = [UIBezierPath bezierPath];
    [path0 moveToPoint:CGPointMake( 233.19, 85.76)];
    [path0 addCurveToPoint:CGPointMake(237, 76.5) controlPoint1: CGPointMake(235.57, 83.25) controlPoint2: CGPointMake(237, 80.02)];
    [path0 addCurveToPoint:CGPointMake(220.5, 62) controlPoint1: CGPointMake(237, 68.49) controlPoint2: CGPointMake(229.61, 62)];
    [path0 addCurveToPoint:CGPointMake(215.97, 62.55) controlPoint1: CGPointMake(218.93, 62) controlPoint2: CGPointMake(217.41, 62.19)];
    [path0 addCurveToPoint:CGPointMake(199.5, 49) controlPoint1: CGPointMake(215.41, 54.99) controlPoint2: CGPointMake(208.25, 49)];
    [path0 addCurveToPoint:CGPointMake(191.6, 50.77) controlPoint1: CGPointMake(196.64, 49) controlPoint2: CGPointMake(193.94, 49.64)];
    [path0 addCurveToPoint:CGPointMake(180.5, 47) controlPoint1: CGPointMake(188.67, 48.43) controlPoint2: CGPointMake(184.77, 47)];
    [path0 addCurveToPoint:CGPointMake(175.97, 47.55) controlPoint1: CGPointMake(178.93, 47) controlPoint2: CGPointMake(177.41, 47.19)];
    [path0 addCurveToPoint:CGPointMake(159.5, 34) controlPoint1: CGPointMake(175.41, 39.99) controlPoint2: CGPointMake(168.25, 34)];
    [path0 addCurveToPoint:CGPointMake(145.59, 40.7) controlPoint1: CGPointMake(153.65, 34) controlPoint2: CGPointMake(148.52, 36.67)];
    [path0 addCurveToPoint:CGPointMake(140.5, 40) controlPoint1: CGPointMake(143.98, 40.25) controlPoint2: CGPointMake(142.28, 40)];
    [path0 addCurveToPoint:CGPointMake(130.81, 42.77) controlPoint1: CGPointMake(136.88, 40) controlPoint2: CGPointMake(133.53, 41.03)];
    [path0 addCurveToPoint:CGPointMake(125.5, 42) controlPoint1: CGPointMake(129.14, 42.27) controlPoint2: CGPointMake(127.36, 42)];
    [path0 addCurveToPoint:CGPointMake(111.59, 48.7) controlPoint1: CGPointMake(119.65, 42) controlPoint2: CGPointMake(114.52, 44.67)];
    [path0 addCurveToPoint:CGPointMake(106.5, 48) controlPoint1: CGPointMake(109.98, 48.25) controlPoint2: CGPointMake(108.28, 48)];
    [path0 addCurveToPoint:CGPointMake(90, 62.5) controlPoint1: CGPointMake(97.39, 48) controlPoint2: CGPointMake(90, 54.49)];
    [path0 addCurveToPoint:CGPointMake(90.01, 63.02) controlPoint1: CGPointMake(90, 62.68) controlPoint2: CGPointMake(90, 62.85)];
    [path0 addCurveToPoint:CGPointMake(88.59, 64.7) controlPoint1: CGPointMake(89.49, 63.55) controlPoint2: CGPointMake(89.02, 64.11)];
    [path0 addCurveToPoint:CGPointMake(83.5, 64) controlPoint1: CGPointMake(86.98, 64.25) controlPoint2: CGPointMake(85.28, 64)];
    [path0 addCurveToPoint:CGPointMake(67, 78.5) controlPoint1: CGPointMake(74.39, 64) controlPoint2: CGPointMake(67, 70.49)];
    [path0 addCurveToPoint:CGPointMake(68.58, 84.71) controlPoint1: CGPointMake(67, 80.72) controlPoint2: CGPointMake(67.57, 82.83)];
    [path0 addCurveToPoint:CGPointMake(66, 92.5) controlPoint1: CGPointMake(66.95, 86.96) controlPoint2: CGPointMake(66, 89.63)];
    [path0 addCurveToPoint:CGPointMake(67.19, 97.92) controlPoint1: CGPointMake(66, 94.42) controlPoint2: CGPointMake(66.42, 96.25)];
    [path0 addCurveToPoint:CGPointMake(64, 106.5) controlPoint1: CGPointMake(65.19, 100.33) controlPoint2: CGPointMake(64, 103.29)];
    [path0 addCurveToPoint:CGPointMake(65.58, 112.71) controlPoint1: CGPointMake(64, 108.72) controlPoint2: CGPointMake(64.57, 110.83)];
    [path0 addCurveToPoint:CGPointMake(63, 120.5) controlPoint1: CGPointMake(63.95, 114.96) controlPoint2: CGPointMake(63, 117.63)];
    [path0 addCurveToPoint:CGPointMake(79.5, 135) controlPoint1: CGPointMake(63, 128.51) controlPoint2: CGPointMake(70.39, 135)];
    [path0 addCurveToPoint:CGPointMake(81.68, 134.88) controlPoint1: CGPointMake(80.24, 135) controlPoint2: CGPointMake(80.96, 134.96)];
    [path0 addCurveToPoint:CGPointMake(96.5, 143) controlPoint1: CGPointMake(84.36, 139.69) controlPoint2: CGPointMake(89.99, 143)];
    [path0 addCurveToPoint:CGPointMake(104.35, 141.26) controlPoint1: CGPointMake(99.34, 143) controlPoint2: CGPointMake(102.02, 142.37)];
    [path0 addCurveToPoint:CGPointMake(119.5, 150) controlPoint1: CGPointMake(106.89, 146.4) controlPoint2: CGPointMake(112.72, 150)];
    [path0 addCurveToPoint:CGPointMake(121.68, 149.88) controlPoint1: CGPointMake(120.24, 150) controlPoint2: CGPointMake(120.96, 149.96)];
    [path0 addCurveToPoint:CGPointMake(136.5, 158) controlPoint1: CGPointMake(124.36, 154.69) controlPoint2: CGPointMake(129.99, 158)];
    [path0 addCurveToPoint:CGPointMake(145, 155.93) controlPoint1: CGPointMake(139.61, 158) controlPoint2: CGPointMake(142.52, 157.24)];
    [path0 addCurveToPoint:CGPointMake(149.66, 157.6) controlPoint1: CGPointMake(146.43, 156.69) controlPoint2: CGPointMake(147.99, 157.26)];
    [path0 addCurveToPoint:CGPointMake(162.5, 163) controlPoint1: CGPointMake(152.68, 160.9) controlPoint2: CGPointMake(157.31, 163)];
    [path0 addCurveToPoint:CGPointMake(170.35, 161.26) controlPoint1: CGPointMake(165.34, 163) controlPoint2: CGPointMake(168.02, 162.37)];
    [path0 addCurveToPoint:CGPointMake(185.5, 170) controlPoint1: CGPointMake(172.89, 166.4) controlPoint2: CGPointMake(178.72, 170)];
    [path0 addCurveToPoint:CGPointMake(187.68, 169.88) controlPoint1: CGPointMake(186.24, 170) controlPoint2: CGPointMake(186.96, 169.96)];
    [path0 addCurveToPoint:CGPointMake(202.5, 178) controlPoint1: CGPointMake(190.36, 174.69) controlPoint2: CGPointMake(195.99, 178)];
    [path0 addCurveToPoint:CGPointMake(211, 175.93) controlPoint1: CGPointMake(205.61, 178) controlPoint2: CGPointMake(208.52, 177.24)];
    [path0 addCurveToPoint:CGPointMake(219.5, 178) controlPoint1: CGPointMake(213.48, 177.24) controlPoint2: CGPointMake(216.39, 178)];
    [path0 addCurveToPoint:CGPointMake(236, 163.5) controlPoint1: CGPointMake(228.61, 178) controlPoint2: CGPointMake(236, 171.51)];
    [path0 addCurveToPoint:CGPointMake(235.99, 162.99) controlPoint1: CGPointMake(236, 163.33) controlPoint2: CGPointMake(236, 163.16)];
    [path0 addCurveToPoint:CGPointMake(236.5, 163) controlPoint1: CGPointMake(236.16, 163) controlPoint2: CGPointMake(236.33, 163)];
    [path0 addCurveToPoint:CGPointMake(245, 160.93) controlPoint1: CGPointMake(239.61, 163) controlPoint2: CGPointMake(242.52, 162.24)];
    [path0 addCurveToPoint:CGPointMake(253.5, 163) controlPoint1: CGPointMake(247.48, 162.24) controlPoint2: CGPointMake(250.39, 163)];
    [path0 addCurveToPoint:CGPointMake(270, 148.5) controlPoint1: CGPointMake(262.61, 163) controlPoint2: CGPointMake(270, 156.51)];
    [path0 addCurveToPoint:CGPointMake(269.66, 145.56) controlPoint1: CGPointMake(270, 147.49) controlPoint2: CGPointMake(269.88, 146.51)];
    [path0 addCurveToPoint:CGPointMake(277, 133.5) controlPoint1: CGPointMake(274.09, 142.96) controlPoint2: CGPointMake(277, 138.53)];
    [path0 addCurveToPoint:CGPointMake(273.19, 124.24) controlPoint1: CGPointMake(277, 129.98) controlPoint2: CGPointMake(275.57, 126.75)];
    [path0 addCurveToPoint:CGPointMake(280, 112.5) controlPoint1: CGPointMake(277.32, 121.6) controlPoint2: CGPointMake(280, 117.33)];
    [path0 addCurveToPoint:CGPointMake(263.5, 98) controlPoint1: CGPointMake(280, 104.49) controlPoint2: CGPointMake(272.61, 98)];
    [path0 addCurveToPoint:CGPointMake(258.96, 98.55) controlPoint1: CGPointMake(261.93, 98) controlPoint2: CGPointMake(260.41, 98.19)];
    [path0 addCurveToPoint:CGPointMake(242.5, 85) controlPoint1: CGPointMake(258.41, 90.99) controlPoint2: CGPointMake(251.25, 85)];
    [path0 addCurveToPoint:CGPointMake(234.6, 86.77) controlPoint1: CGPointMake(239.64, 85) controlPoint2: CGPointMake(236.94, 85.64)];
    [path0 addCurveToPoint:CGPointMake(233.19, 85.76) controlPoint1: CGPointMake(234.15, 86.41) controlPoint2: CGPointMake(233.68, 86.08)];
    [path0 closePath];

    
    // path2
    UIBezierPath * path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:CGPointMake( 102, 270.5)];
    [path1 addCurveToPoint:CGPointMake(163.5, 207.5) controlPoint1: CGPointMake(121.83, 264.67) controlPoint2: CGPointMake(161.9, 243.9)];
    [path1 addCurveToPoint:CGPointMake(153.5, 160.5) controlPoint1: CGPointMake(165.1, 171.1) controlPoint2: CGPointMake(157.5, 161)];
    [path1 moveToPoint:CGPointMake( 245.5, 276)];
    [path1 addCurveToPoint:CGPointMake(192, 247) controlPoint1: CGPointMake(227.17, 275) controlPoint2: CGPointMake(190.8, 267.8)];
    [path1 addCurveToPoint:CGPointMake(203, 188.5) controlPoint1: CGPointMake(193.2, 226.2) controlPoint2: CGPointMake(199.83, 199.33)];
    [path1 addCurveToPoint:CGPointMake(212.5, 176.5) controlPoint1: CGPointMake(205.17, 184.17) controlPoint2: CGPointMake(210.1, 175.7)];
    [path1 moveToPoint:CGPointMake( 178.5, 185)];
    [path1 addCurveToPoint:CGPointMake(171, 234) controlPoint1: CGPointMake(177, 200.17) controlPoint2: CGPointMake(173.4, 231.2)];
    [path1 moveToPoint:CGPointMake( 183.5, 259.5)];
    [path1 addCurveToPoint:CGPointMake(188.5, 188.5) controlPoint1: CGPointMake(183.5, 251.5) controlPoint2: CGPointMake(182.5, 203)];
    [path1 moveToPoint:CGPointMake( 165, 227.5)];
    [path1 addCurveToPoint:CGPointMake(144.5, 256.5) controlPoint1: CGPointMake(152, 246.5) controlPoint2: CGPointMake(150.5, 251)];

    // path3 кусты
    UIBezierPath * path2 = [UIBezierPath bezierPath];
    [path2 moveToPoint:CGPointMake( 119.5, 263.5)];
    [path2 addCurveToPoint:CGPointMake(86, 268.81) controlPoint1: CGPointMake(111.5, 255) controlPoint2: CGPointMake(96.4, 255.61)];
    [path2 moveToPoint:CGPointMake( 59.5, 275)];
    [path2 addCurveToPoint:CGPointMake(83.5, 268) controlPoint1: CGPointMake(62.83, 271.17) controlPoint2: CGPointMake(72.3, 264.4)];
    [path2 addCurveToPoint:CGPointMake(94, 272) controlPoint1: CGPointMake(94.7, 271.6) controlPoint2: CGPointMake(95.17, 272.17)];
    [path2 moveToPoint:CGPointMake( 198, 260.5)];
    [path2 addCurveToPoint:CGPointMake(221.5, 260.5) controlPoint1: CGPointMake(203, 257.73) controlPoint2: CGPointMake(214.7, 253.85)];
    [path2 addCurveToPoint:CGPointMake(226.74, 266.5) controlPoint1: CGPointMake(223.78, 262.73) controlPoint2: CGPointMake(225.48, 264.74)];
    [path2 moveToPoint:CGPointMake( 230, 273.5)];
    [path2 addCurveToPoint:CGPointMake(226.74, 266.5) controlPoint1: CGPointMake(230, 272.46) controlPoint2: CGPointMake(229.25, 269.99)];
    [path2 moveToPoint:CGPointMake( 226.74, 266.5)];
    [path2 addCurveToPoint:CGPointMake(261.5, 268) controlPoint1: CGPointMake(238.33, 263.33) controlPoint2: CGPointMake(261.5, 259.2)];
    [path2 addCurveToPoint:CGPointMake(244.5, 276) controlPoint1: CGPointMake(261.5, 276.8) controlPoint2: CGPointMake(245.83, 275.17)];
    
    // MARK:  drawing parameters

    [_layer0 setLineWidth:2];
    [_layer0 setPath:path0.CGPath];
    [_layer0 setStrokeColor:color0.CGColor];
    [_layer0 setFillColor:nil];
    [_layer0 setStrokeStart:0.0];
    [_layer0 setStrokeEnd:0.0];
    [self.layer addSublayer:_layer0];

    [_layer1 setPath:path1.CGPath];
    [_layer1 setStrokeColor:color1.CGColor];
    [_layer1 setFillColor:nil];
    [_layer1 setStrokeStart:0.0];
    [_layer1 setStrokeEnd:0.0];
    [self.layer addSublayer:_layer1];

    [_layer2 setPath:path2.CGPath];
    [_layer2 setStrokeColor:color2.CGColor];
    [_layer2 setFillColor:nil];
    [_layer2 setStrokeStart:0.0];
    [_layer2 setStrokeEnd:0.0];
    [self.layer addSublayer:_layer2];

    [self clearsContextBeforeDrawing];
    [self.layer setNeedsLayout]; // мб поможет обновлять лэер в будущем.

} // drawTree

- (void)drawMoterFucker:(UIColor*)color0 :(UIColor*)color1 :(UIColor*)color2 {

    _layer0 = [CAShapeLayer layer];
    _layer1 = [CAShapeLayer layer];
    _layer2 = [CAShapeLayer layer];
    
    
    _layer0.bounds = CGRectMake(-150, -150, 340, 340);
    _layer1.bounds = CGRectMake(-150, -150, 340, 340);
    _layer2.bounds = CGRectMake(-150, -150, 340, 340);
    
    // path0
    UIBezierPath * path0 = [UIBezierPath bezierPath];
    [path0 moveToPoint:CGPointMake(81.5, 49)];
    [path0 addLineToPoint:CGPointMake(97, 109)];
    [path0 addLineToPoint:CGPointMake(109, 132)];
    [path0 addLineToPoint:CGPointMake(126.5, 151.5)];
    [path0 addLineToPoint:CGPointMake(153.5, 174)];
    [path0 addLineToPoint:CGPointMake(177, 179.5)];
    [path0 addLineToPoint:CGPointMake(213, 162)];
    [path0 addLineToPoint:CGPointMake(240, 132)];
    [path0 addLineToPoint:CGPointMake(248.5, 120)];
    [path0 addLineToPoint:CGPointMake(250.5, 70.5)];
    [path0 addLineToPoint:CGPointMake(238.5, 60.5)];
    [path0 addLineToPoint:CGPointMake(222, 63.5)];
    [path0 addLineToPoint:CGPointMake(211, 80.5)];
    [path0 addLineToPoint:CGPointMake(209, 103.5)];
    [path0 addLineToPoint:CGPointMake(213, 116)];

    // MARK: - path1
    UIBezierPath * path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:CGPointMake(204, 120)];
    [path1 addLineToPoint:CGPointMake(195.5, 118.5)];
    [path1 addLineToPoint:CGPointMake(186, 120.5)];
    [path1 addLineToPoint:CGPointMake(178, 121.5)];
    [path1 addLineToPoint:CGPointMake(168.5, 120.5)];
    [path1 addLineToPoint:CGPointMake(160, 119)];
    [path1 addLineToPoint:CGPointMake(153.5, 118.5)];
    [path1 addLineToPoint:CGPointMake(146, 120)];
    [path1 addLineToPoint:CGPointMake(141.5, 122)];
    [path1 addLineToPoint:CGPointMake(147.5, 124.5)];
    [path1 addLineToPoint:CGPointMake(152, 128)];
    [path1 addLineToPoint:CGPointMake(156.5, 133)];
    [path1 addLineToPoint:CGPointMake(162.5, 135.5)];
    [path1 addLineToPoint:CGPointMake(170, 136.5)];
    [path1 addLineToPoint:CGPointMake(177, 135.5)];
    [path1 addLineToPoint:CGPointMake(184.5, 136.5)];
    [path1 addLineToPoint:CGPointMake(190.5, 135.5)];
    [path1 addLineToPoint:CGPointMake(197, 131.5)];
    [path1 addLineToPoint:CGPointMake(204, 123.5)];
    [path1 addLineToPoint:CGPointMake(208.5, 117.5)];
    [path1 addLineToPoint:CGPointMake(200.5, 116.5)];
    [path1 addLineToPoint:CGPointMake(191.5, 115.5)];
    [path1 addLineToPoint:CGPointMake(182.5, 113.5)];
    [path1 addLineToPoint:CGPointMake(174, 113)];
    [path1 addLineToPoint:CGPointMake(164, 114.5)];
    [path1 addLineToPoint:CGPointMake(155, 116.5)];
    [path1 addLineToPoint:CGPointMake(145, 117.5)];
    [path1 addLineToPoint:CGPointMake(138, 117)];
    [path1 addLineToPoint:CGPointMake(147.5, 111)];
    [path1 addLineToPoint:CGPointMake(156.5, 104.5)];
    [path1 addLineToPoint:CGPointMake(162.5, 101)];
    [path1 addLineToPoint:CGPointMake(167.5, 102.5)];
    [path1 addLineToPoint:CGPointMake(173, 104.5)];
    [path1 addLineToPoint:CGPointMake(179.5, 103.5)];
    [path1 addLineToPoint:CGPointMake(186, 102.5)];
    [path1 addLineToPoint:CGPointMake(194.5, 104.5)];
    [path1 addLineToPoint:CGPointMake(199.5, 109.5)];
    [path1 addLineToPoint:CGPointMake(207, 114)];
    

    // MARK: - path2
    UIBezierPath * path2 = [UIBezierPath bezierPath];
    [path2 moveToPoint:CGPointMake(209.5, 122.5)];
    [path2 addLineToPoint:CGPointMake(214, 128.5)];
    [path2 addLineToPoint:CGPointMake(216.5, 135)];
    [path2 addLineToPoint:CGPointMake(213, 144)];
    [path2 addLineToPoint:CGPointMake(206, 152.5)];
    [path2 addLineToPoint:CGPointMake(197, 159.5)];
    [path2 addLineToPoint:CGPointMake(187.5, 152.5)];
    [path2 addLineToPoint:CGPointMake(177, 148.5)];
    [path2 addLineToPoint:CGPointMake(155.5, 152.5)];
    [path2 addLineToPoint:CGPointMake(147.5, 162)];
    [path2 addLineToPoint:CGPointMake(141, 174.5)];
    [path2 addLineToPoint:CGPointMake(129.5, 167.5)];
    [path2 addLineToPoint:CGPointMake(121.5, 157.5)];
    [path2 addLineToPoint:CGPointMake(113, 148.5)];
    [path2 addLineToPoint:CGPointMake(106, 219)];
    [path2 addLineToPoint:CGPointMake(94.5, 227.5)];
    [path2 addLineToPoint:CGPointMake(83.5, 234.5)];
    [path2 addLineToPoint:CGPointMake(101, 241)];
    [path2 addLineToPoint:CGPointMake(114.5, 249.5)];
    [path2 addLineToPoint:CGPointMake(125, 263.5)];
    [path2 addLineToPoint:CGPointMake(139, 281)];
    [path2 addLineToPoint:CGPointMake(158, 299)];
    [path2 addLineToPoint:CGPointMake(177, 305.5)];
    [path2 addLineToPoint:CGPointMake(206, 297.5)];
    [path2 addLineToPoint:CGPointMake(219.5, 281)];
    [path2 addLineToPoint:CGPointMake(229.5, 259.5)];
    [path2 addLineToPoint:CGPointMake(239, 243.5)];
    [path2 addLineToPoint:CGPointMake(253.5, 237)];
    [path2 addLineToPoint:CGPointMake(250.5, 221.5)];
    [path2 addLineToPoint:CGPointMake(241, 193)];
    [path2 addLineToPoint:CGPointMake(239, 170)];
    [path2 addLineToPoint:CGPointMake(232, 157.5)];
    [path2 addLineToPoint:CGPointMake(224, 165.5)];
    [path2 addLineToPoint:CGPointMake(216.5, 174.5)];
    [path2 addLineToPoint:CGPointMake(200, 190.5)];
    [path2 addLineToPoint:CGPointMake(190, 205)];
    [path2 addLineToPoint:CGPointMake(181.5, 226.5)];
    [path2 addLineToPoint:CGPointMake(178.5, 252.5)];
    
    
    
    
    [_layer0 setLineWidth:2];
    [_layer0 setPath:path0.CGPath];
    [_layer0 setStrokeColor:color0.CGColor];
    [_layer0 setFillColor:nil];
    [_layer0 setStrokeStart:0.0];
    [_layer0 setStrokeEnd:0.0];
    [self.layer addSublayer:_layer0];

    [_layer1 setPath:path1.CGPath];
    [_layer1 setStrokeColor:color1.CGColor];
    [_layer1 setFillColor:nil];
    [_layer1 setStrokeStart:0.0];
    [_layer1 setStrokeEnd:0.0];
    [self.layer addSublayer:_layer1];

    [_layer2 setPath:path2.CGPath];
    [_layer2 setStrokeColor:color2.CGColor];
    [_layer2 setFillColor:nil];
    [_layer2 setStrokeStart:0.0];
    [_layer2 setStrokeEnd:0.0];
    [self.layer addSublayer:_layer2];

    [self clearsContextBeforeDrawing];
    [self.layer setNeedsLayout]; // мб поможет обновлять лэер в будущем.

}




- (void)drawRect:(CGRect)rect {
    NSString * currentPicture = [PlistWorker readValueForKey:@"pictureName"];
    NSArray * pathColors = [PlistWorker readValueForKey:@"pathColors"];
    UIColor * color0 = [UIColor colorNamed:[pathColors objectAtIndex:0]];
    UIColor * color1 = [UIColor colorNamed:[pathColors objectAtIndex:1]];
    UIColor * color2 = [UIColor colorNamed:[pathColors objectAtIndex:2]];
    
    if ([currentPicture isEqualToString: @"head"]) {
          [self drawHead       :color0 :color1 :color2];
      } else if ([currentPicture isEqualToString: @"planet"]) {
          [self drawPlanet     :color0 :color1 :color2];
      } else if ([currentPicture isEqualToString: @"landscape"]) {
          [self drawLandscape  :color0 :color1 :color2];
      } else if ([currentPicture isEqualToString: @"tree"]) {
          [self drawTree       :color0 :color1 :color2];
      }
    
//    
//    [self drawMoterFucker:UIColor.blueColor :UIColor.blueColor :UIColor.blueColor];
//    [self drawTree:UIColor.blueColor :UIColor.blueColor :UIColor.blueColor];
    

}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
