//
//  ViewController.h
//  JSAndOC
//
//  Created by MR.KING on 16/5/18.
//  Copyright © 2016年 Tmp. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <JavaScriptCore/JavaScriptCore.h>

@interface ViewController : UIViewController


@end



@protocol CustomDelegate <JSExport>

// 这里面我们可以自定义一些方法
// 如：

// js 调用oc的弹框
-(void)alertWith:(NSString*)title message:(NSString*)message btnTitle:(NSString*)arrTitle;


// 当然还可以定义更多的方法
/**
 *  。。。。。。。。
 */

@end


@interface CustomModel : NSObject<CustomDelegate>

@end

@implementation CustomModel

-(void)alertWith:(NSString*)title message:(NSString*)message btnTitle:(NSString *)btnTitle{
    // 这里可以调用系统的弹框
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:title message:message delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:btnTitle, nil];
        [alertView show];
    });
}

@end
