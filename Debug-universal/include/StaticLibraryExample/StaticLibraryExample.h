//
//  StaticLibraryExample.h
//  StaticLibraryExample
//
//  Created by apple on 06/05/17.
//  Copyright © 2017 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface StaticLibraryExample : NSObject
@property (nonatomic,readonly) UIImage *originalImage;
@property (nonatomic,strong) CIContext  *context;
@property (nonatomic,strong) CIImage    *beginImage;

@end
