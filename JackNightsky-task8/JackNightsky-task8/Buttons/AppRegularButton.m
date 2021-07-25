//
//  AppRegularButton.m
//  JackNightsky-task8
//
//  Created by Jack on 17.07.21.
//

#import "AppRegularButton.h"
#import "UIColor+Palette.h"

@implementation AppRegularButton


- (void)setCurrentState:(CurrentStatement)currentState {
    switch (currentState) {
        case ready:
            _currentState = ready;
            [self commonInit];
            break;
        case active:
            _currentState = active;
            self.layer.shadowColor = [UIColor.rsLightGreenSea colorWithAlphaComponent:1].CGColor;
            self.layer.shadowRadius  = 4;
            break;
            
        default:
            break;
    }
}



// Set appearens for states Checked and Unchecked
-(void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    if (highlighted) {
        self.layer.backgroundColor = [[UIColor rsWhite] colorWithAlphaComponent:1].CGColor;
        
        self.layer.shadowColor = [UIColor.rsLightGreenSea colorWithAlphaComponent:1].CGColor;
        self.layer.shadowRadius  = 4;
        
        if (self.currentState) {
            self.layer.shadowRadius  = self.layer.shadowRadius * 2;
        }
    } else {
        [self commonInit];
    }
}


// Set appearens for states Enabled and Disabled
- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    if (!enabled) {
        self.layer.shadowOpacity = 0.25;
        self.alpha = 0.5;
    } else {
        [self commonInit];
    }
}
//
//- (void) setStateActive:(BOOL)stateActive {
//    _stateActive = stateActive;
//}

- (void) commonInit {
    // crutch
    if (!self.isEnabled) {
        self.alpha = 0.5;
    } else {
        self.alpha = 1;
    }
    
    if (self.isSelected) {
        _currentState = active;
        [self setSelected:NO];
    }
    
    self.titleLabel.font = [UIFont fontWithName:@"Montserrat-Medium" size:18];
    
    // Button appearance for state NORMAL
    self.backgroundColor = UIColor.rsWhite;
    
    [self setTitleColor:UIColor.rsLightGreenSea forState:UIControlStateNormal];
    
    self.layer.cornerRadius  = 10;
    
    self.layer.shadowColor   = [UIColor.rsBlack colorWithAlphaComponent:0.25].CGColor;
    self.layer.shadowRadius  = 2;
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowOffset  = CGSizeMake(0, 0);
    
    [self setTitleEdgeInsets:UIEdgeInsetsMake(5, 21, 5, 21)];
    
    if (_currentState == active) {
        self.layer.shadowColor = [UIColor.rsLightGreenSea colorWithAlphaComponent:1].CGColor;
        self.layer.shadowRadius  = 4;
    }
    if (_currentState == ready) {
        self.layer.shadowColor = [UIColor.rsBlack colorWithAlphaComponent:0.25].CGColor;
        self.layer.shadowRadius  = 4;
    }
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
