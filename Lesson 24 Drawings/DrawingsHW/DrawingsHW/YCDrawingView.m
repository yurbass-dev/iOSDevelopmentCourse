//
//  YCDrawingView.m
//  DrawingsHW
//
//  Created by Yuriy on 10.12.2018.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "YCDrawingView.h"

@interface YCDrawingView ()

@property (strong, nonatomic) NSMutableDictionary *topsOfStarDictionary;
@property (strong, nonatomic) NSMutableArray *starRectsArray;

@property (strong, nonatomic) UIColor *lineColor;
@property (assign, nonatomic) CGFloat lineWidth;
@property (assign, nonatomic) CGContextRef context;
@property (assign, nonatomic) CGPoint touchPoint;
@property (assign, nonatomic) CGPoint startingPoint;

@end

@implementation YCDrawingView

#pragma mark - Pupil
/*
- (void)drawRect:(CGRect)rect {

    self.topsOfStarDictionary = [NSMutableDictionary dictionary];
    
    [self drawStarInPoint:CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect))
                 withSize:400.f
                 andColor:[UIColor redColor].CGColor
              andSaveTops:self.topsOfStarDictionary];

    
    if (self.topsOfStarDictionary.count == 5) {
        [self drawEllipseOnTopsOfStar:self.topsOfStarDictionary
                             withSize:40.f
                             andColor:[UIColor blueColor].CGColor];
        [self drawLinesBetweenTopsOfStar:self.topsOfStarDictionary
                               withColor:[UIColor greenColor].CGColor];
    }
}

- (void)drawStarInPoint:(CGPoint)pointOnView withSize:(CGFloat)size andColor:(CGColorRef)color andSaveTops:(NSMutableDictionary *)topsOfStarDictionary {
    
    NSArray *topsOfStar = @[@"0", @"2", @"4", @"1", @"3"];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat xCenter = pointOnView.x;
    CGFloat yCenter = pointOnView.y;
    CGContextSetStrokeColorWithColor(context, color);
    
    CGFloat w = size;
    CGFloat r = w / 2.0f;
    CGFloat flip = -1.0f;
    CGFloat theta = 2.0f * M_PI * (2.0f / 5.0f); // 144 degrees
    
    CGPoint topsOfStarPoint = CGPointMake(xCenter, r * flip + yCenter);
    CGContextMoveToPoint(context, topsOfStarPoint.x, topsOfStarPoint.y);
    
    [topsOfStarDictionary setObject:[NSValue valueWithCGPoint:topsOfStarPoint] forKey:[topsOfStar objectAtIndex:0]];
    
    for (NSUInteger k = 1; k < 5; k++) {
        
        CGFloat x = r * sin(k * theta);
        CGFloat y = r * cos(k * theta);
        topsOfStarPoint = CGPointMake(x + xCenter, y * flip + yCenter);
        CGContextAddLineToPoint(context, topsOfStarPoint.x, topsOfStarPoint.y);
        
        [topsOfStarDictionary setObject:[NSValue valueWithCGPoint:topsOfStarPoint] forKey:[topsOfStar objectAtIndex:k]];
    }
    
    CGContextClosePath(context);
    CGContextStrokePath(context);
}

- (void)drawEllipseOnTopsOfStar:(NSMutableDictionary *)topsOfStarDictionary withSize:(CGFloat)size andColor:(CGColorRef)color {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, color);
    
    for (NSUInteger i = 0; i < topsOfStarDictionary.count; i++) {
        
        CGPoint topsOfStarPoint = [[topsOfStarDictionary valueForKey:[NSString stringWithFormat:@"%lu", i]] CGPointValue];
        CGRect ellipseRect = CGRectMake(topsOfStarPoint.x - size / 2.f, topsOfStarPoint.y - size / 2.f, size, size);
        CGContextAddEllipseInRect(context, ellipseRect);
    }
    CGContextStrokePath(context);
}

- (void)drawLinesBetweenTopsOfStar:(NSMutableDictionary *)topsOfStarDictionary withColor:(CGColorRef)color {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, color);
    
    CGPoint topsOfStarPoint = [[topsOfStarDictionary valueForKey:@"0"] CGPointValue];
    
    for (NSUInteger i = 1; i <= topsOfStarDictionary.count; i++) {
        
        CGContextMoveToPoint(context, topsOfStarPoint.x, topsOfStarPoint.y);
        topsOfStarPoint = [[topsOfStarDictionary valueForKey:[NSString stringWithFormat:@"%lu", i]] CGPointValue];
        
        if (i == topsOfStarDictionary.count) {
            topsOfStarPoint = [[topsOfStarDictionary valueForKey:@"0"] CGPointValue];
        }
        CGContextAddLineToPoint(context, topsOfStarPoint.x, topsOfStarPoint.y);
    }
    CGContextStrokePath(context);
}
*/

#pragma mark - Student (first version)
/*
- (void)drawRect:(CGRect)rect {
    
    self.topsOfStarDictionary = [NSMutableDictionary dictionary];
    self.starRectsArray = [NSMutableArray array];
    
    [self drawStarsAtRect:rect
         withNumberOfStar:6
                 withSize:350.f
           withTopsOfStar:self.topsOfStarDictionary
         andWithStarRects:self.starRectsArray];
}

#pragma mark - DrawStarEllipseAndLines Methods

- (void)drawStarAtPoint:(CGPoint)pointOnView withSize:(CGFloat)size andColor:(CGColorRef)color andSaveTops:(NSMutableDictionary *)topsOfStarDictionary {
    
    NSArray *topsOfStar = @[@"0", @"2", @"4", @"1", @"3"];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat xCenter = pointOnView.x;
    CGFloat yCenter = pointOnView.y;
    CGContextSetFillColorWithColor(context, color);
    
    CGFloat w = size;
    CGFloat r = w / 2.f;
    CGFloat flip = -1.f;
    CGFloat theta = 2.f * M_PI * (2.f / 5.f); // 144 degrees
    
    CGPoint topsOfStarPoint = CGPointMake(xCenter, r * flip + yCenter);
    CGContextMoveToPoint(context, topsOfStarPoint.x, topsOfStarPoint.y);
    
    [topsOfStarDictionary setObject:[NSValue valueWithCGPoint:topsOfStarPoint] forKey:[topsOfStar objectAtIndex:0]];
    
    for (NSUInteger k = 1; k < 5; k++) {
        
        CGFloat x = r * sin(k * theta);
        CGFloat y = r * cos(k * theta);
        topsOfStarPoint = CGPointMake(x + xCenter, y * flip + yCenter);
        CGContextAddLineToPoint(context, topsOfStarPoint.x, topsOfStarPoint.y);
        
        [topsOfStarDictionary setObject:[NSValue valueWithCGPoint:topsOfStarPoint] forKey:[topsOfStar objectAtIndex:k]];
    }
    
    CGContextClosePath(context);
    CGContextFillPath(context);
}

- (void)drawEllipseOnTopsOfStar:(NSMutableDictionary *)topsOfStarDictionary withSize:(CGFloat)size andColor:(CGColorRef)color {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color);
    
    for (NSUInteger i = 0; i < topsOfStarDictionary.count; i++) {
        
        CGPoint topsOfStarPoint = [[topsOfStarDictionary valueForKey:[NSString stringWithFormat:@"%lu", i]] CGPointValue];
        CGRect ellipseRect = CGRectMake(topsOfStarPoint.x - size / 2.f, topsOfStarPoint.y - size / 2.f, size, size);
        CGContextAddEllipseInRect(context, ellipseRect);
    }
    CGContextFillPath(context);
}

- (void)drawLinesBetweenTopsOfStar:(NSMutableDictionary *)topsOfStarDictionary withLineWidth:(CGFloat)width andColor:(CGColorRef)color {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, color);
    CGContextSetLineWidth(context, width);
    
    CGPoint topsOfStarPoint = [[topsOfStarDictionary valueForKey:@"0"] CGPointValue];
    
    for (NSUInteger i = 1; i <= topsOfStarDictionary.count; i++) {
        
        CGContextMoveToPoint(context, topsOfStarPoint.x, topsOfStarPoint.y);
        topsOfStarPoint = [[topsOfStarDictionary valueForKey:[NSString stringWithFormat:@"%lu", i]] CGPointValue];
        
        if (i == topsOfStarDictionary.count) {
            topsOfStarPoint = [[topsOfStarDictionary valueForKey:@"0"] CGPointValue];
        }
        CGContextAddLineToPoint(context, topsOfStarPoint.x, topsOfStarPoint.y);
    }
    CGContextStrokePath(context);
}

#pragma mark - RandomColor

- (UIColor*)randomColor {
    
    CGFloat r = arc4random_uniform(256) / 255.f;
    CGFloat g = arc4random_uniform(256) / 255.f;
    CGFloat b = arc4random_uniform(256) / 255.f;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
}

#pragma mark - DrawLittleStars

- (void)drawStarsAtRect:(CGRect)rect withNumberOfStar:(NSUInteger)numberOfStar withSize:(CGFloat)sizeStar
         withTopsOfStar:(NSMutableDictionary *)topsOfStarDictionary andWithStarRects:(NSMutableArray *)starRectsArray {
    
    CGFloat sizeLittleStar = sizeStar / 2.3f;
    CGPoint centerBigStarPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
    BOOL isIntersectsOrNoContains = false;
    
    for (NSUInteger i = 0; i < numberOfStar; i++) {
        
        CGPoint centerStarPoint = CGPointMake(arc4random_uniform((uint32_t) CGRectGetMaxX(rect)),
                                              arc4random_uniform((uint32_t) CGRectGetMaxY(rect)));
        if (i == 0) {
            centerStarPoint = centerBigStarPoint;
        }
        else if (i == 1) {
            sizeStar = sizeLittleStar;
        }
        
        CGRect currentStarRect = CGRectMake(centerStarPoint.x - sizeStar / 2.f, centerStarPoint.y - sizeStar / 2.f, sizeStar, sizeStar);
        
        for (NSUInteger j = 0; j < starRectsArray.count; j++) {
            // Get star from array
            CGRect starRectFromArray = [[starRectsArray objectAtIndex:j] CGRectValue];
            // If current star intersect any star from array and rect view doesn't contains rect current star,
            // break and find new star
            if (CGRectIntersectsRect(starRectFromArray, currentStarRect) || !CGRectContainsRect(rect, currentStarRect)) {
                isIntersectsOrNoContains = true;
                break;
            }
        }
        
        if (isIntersectsOrNoContains) {
            i--;
            isIntersectsOrNoContains = false;
            continue;
        }
        
        [starRectsArray addObject:[NSValue valueWithCGRect:currentStarRect]];
        
        [self drawStarAtPoint:centerStarPoint
                     withSize:sizeStar
                     andColor:[[self randomColor] CGColor]
                  andSaveTops:topsOfStarDictionary];
        
        [self drawLinesBetweenTopsOfStar:topsOfStarDictionary
                           withLineWidth:sizeStar / 100.f
                                andColor:[[self randomColor] CGColor]];
        
        [self drawEllipseOnTopsOfStar:topsOfStarDictionary
                             withSize:sizeStar / 10.f
                             andColor:[[self randomColor] CGColor]];
    }
}
*/
#pragma mark - Student (second version)

- (void)drawRect:(CGRect)rect {
    
    self.topsOfStarDictionary = [NSMutableDictionary dictionary];
    self.starRectsArray = [NSMutableArray array];
    
    [self drawStarsAtRect:rect
         withNumberOfStar:5
                 withSize:150.f
           withTopsOfStar:self.topsOfStarDictionary
         andWithStarRects:self.starRectsArray];
}

#pragma mark - DrawStarEllipseAndLines Methods

- (void)drawStarAtPoint:(CGPoint)pointOnView withSize:(CGFloat)size andColor:(CGColorRef)color andSaveTops:(NSMutableDictionary *)topsOfStarDictionary {
    
    NSArray *topsOfStar = @[@"0", @"2", @"4", @"1", @"3"];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat xCenter = pointOnView.x;
    CGFloat yCenter = pointOnView.y;
    CGContextSetFillColorWithColor(context, color);
    
    CGFloat w = size;
    CGFloat r = w / 2.f;
    CGFloat flip = -1.f;
    CGFloat theta = 2.f * M_PI * (2.f / 5.f); // 144 degrees
    
    CGPoint topsOfStarPoint = CGPointMake(xCenter, r * flip + yCenter);
    CGContextMoveToPoint(context, topsOfStarPoint.x, topsOfStarPoint.y);
    
    [topsOfStarDictionary setObject:[NSValue valueWithCGPoint:topsOfStarPoint] forKey:[topsOfStar objectAtIndex:0]];
    
    for (NSUInteger k = 1; k < 5; k++) {
        
        CGFloat x = r * sin(k * theta);
        CGFloat y = r * cos(k * theta);
        topsOfStarPoint = CGPointMake(x + xCenter, y * flip + yCenter);
        CGContextAddLineToPoint(context, topsOfStarPoint.x, topsOfStarPoint.y);
        
        [topsOfStarDictionary setObject:[NSValue valueWithCGPoint:topsOfStarPoint] forKey:[topsOfStar objectAtIndex:k]];
    }
    
    CGContextClosePath(context);
    CGContextFillPath(context);
}

- (void)drawEllipseOnTopsOfStar:(NSMutableDictionary *)topsOfStarDictionary withSize:(CGFloat)size andColor:(CGColorRef)color {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color);
    
    for (NSUInteger i = 0; i < topsOfStarDictionary.count; i++) {
        
        CGPoint topsOfStarPoint = [[topsOfStarDictionary valueForKey:[NSString stringWithFormat:@"%lu", i]] CGPointValue];
        CGRect ellipseRect = CGRectMake(topsOfStarPoint.x - size / 2.f, topsOfStarPoint.y - size / 2.f, size, size);
        CGContextAddEllipseInRect(context, ellipseRect);
    }
    CGContextFillPath(context);
}

- (void)drawLinesBetweenTopsOfStar:(NSMutableDictionary *)topsOfStarDictionary withLineWidth:(CGFloat)width andColor:(CGColorRef)color {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, color);
    CGContextSetLineWidth(context, width);
    
    CGPoint topsOfStarPoint = [[topsOfStarDictionary valueForKey:@"0"] CGPointValue];
    
    for (NSUInteger i = 1; i <= topsOfStarDictionary.count; i++) {
        
        CGContextMoveToPoint(context, topsOfStarPoint.x, topsOfStarPoint.y);
        topsOfStarPoint = [[topsOfStarDictionary valueForKey:[NSString stringWithFormat:@"%lu", i]] CGPointValue];
        
        if (i == topsOfStarDictionary.count) {
            topsOfStarPoint = [[topsOfStarDictionary valueForKey:@"0"] CGPointValue];
        }
        CGContextAddLineToPoint(context, topsOfStarPoint.x, topsOfStarPoint.y);
    }
    CGContextStrokePath(context);
}

#pragma mark - RandomColor

- (UIColor*)randomColor {
    
    CGFloat r = arc4random_uniform(256) / 255.f;
    CGFloat g = arc4random_uniform(256) / 255.f;
    CGFloat b = arc4random_uniform(256) / 255.f;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
}

#pragma mark - DrawStars

- (void)drawStarsAtRect:(CGRect)rect withNumberOfStar:(NSUInteger)numberOfStar withSize:(CGFloat)sizeStar
         withTopsOfStar:(NSMutableDictionary *)topsOfStarDictionary andWithStarRects:(NSMutableArray *)starRectsArray {
    
    BOOL isIntersects = false;
    
    for (NSUInteger i = 0; i < numberOfStar; i++) {
        
        CGPoint randomCenterStarPoint = CGPointMake(arc4random_uniform((uint32_t) CGRectGetMaxX(rect)),
                                                    arc4random_uniform((uint32_t) CGRectGetMaxY(rect)));

        CGRect currentStarRect = CGRectMake(randomCenterStarPoint.x - sizeStar / 2.f,
                                            randomCenterStarPoint.y - sizeStar / 2.f,
                                            sizeStar, sizeStar);
        
        for (NSUInteger j = 0; j < starRectsArray.count; j++) {
            CGRect starRectFromArray = [[starRectsArray objectAtIndex:j] CGRectValue];
            
            if (CGRectIntersectsRect(starRectFromArray, currentStarRect)) {
                isIntersects = true;
                break;
            }
        }
        // If current star intersect any star from array and rect view doesn't contains rect current star, find new star
        if (!CGRectContainsRect(rect, currentStarRect) || isIntersects) {
            i--;
            isIntersects = false;
            continue;
        }
        
        [starRectsArray addObject:[NSValue valueWithCGRect:currentStarRect]];
        
        [self drawStarAtPoint:randomCenterStarPoint
                     withSize:sizeStar
                     andColor:[[self randomColor] CGColor]
                  andSaveTops:topsOfStarDictionary];
        
        [self drawLinesBetweenTopsOfStar:topsOfStarDictionary
                           withLineWidth:sizeStar / 100.f
                                andColor:[[self randomColor] CGColor]];
        
        [self drawEllipseOnTopsOfStar:topsOfStarDictionary
                             withSize:sizeStar / 10.f
                             andColor:[[self randomColor] CGColor]];
    }
}





@end
