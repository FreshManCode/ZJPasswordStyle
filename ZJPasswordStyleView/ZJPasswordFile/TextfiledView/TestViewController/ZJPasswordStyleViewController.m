//
//  ZJPasswordStyleViewController.m
//  ZJPasswordStyleView
//
//  Created by 张君君 on 2019/6/24.
//  Copyright © 2019年 com.zhangjunjun.com. All rights reserved.
//

#import "ZJPasswordStyleViewController.h"
#import "ZJModel.h"

#import "ZJPSWTextfieldContext.h"
#import "ZJUIHeader.h"


@interface ZJPasswordStyleViewController () <ZJPasswordViewDelegate>

@property (nonatomic, strong) UIView <ZJPasswordViewProtocol> *textfieldView;

@property (nonatomic, strong) UIView *backView;

@end

@implementation ZJPasswordStyleViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"输入密码";
    [self initUI];
}

- (void)initUI {
    ZJPSWTextfieldViewType viewType = ZJPSWTextfieldViewLineNormal;
    switch (_dataModel.styleType) {
        case ZJPasswordStyleBottomLineNormal: {
            viewType = ZJPSWTextfieldViewLineNormal;
            [self setUpTextfieldViewWithType:viewType];
        }
            break;
        case ZJPasswordStyleBottomLineEncrypt: {
            viewType = ZJPSWTextfieldViewLineEncryption;
            [self setUpTextfieldViewWithType:viewType];
        }
            break;
        case ZJPasswordStyleRectangleNormal: {
            viewType = ZJPSWTextfieldViewRectNormal;
            [self setUpTextfieldViewWithType:viewType];
        }
            break;
        case ZJPasswordStyleRectangleEncrypt: {
            viewType = ZJPSWTextfieldViewRectEncryption;
            [self setUpTextfieldViewWithType:viewType];
        }
            break;
        case ZJPasswordStyleWithAnimating: {
            viewType = ZJPSWTextfieldViewWithAnimating;
            [self setUpTextfieldViewWithType:viewType];
        }
    }
    
}

- (void)setUpTextfieldViewWithType:(ZJPSWTextfieldViewType)type {
    self.textfieldView = [ZJPSWTextfieldContext configureTextfieldView:type frame:CGRectMake(0, 110, ZJWinodwWidth, ZJWinodwHeight - 100)];
    [self.textfieldView setDelegate:self];
    [self.view addSubview:self.textfieldView];
}

- (void)setUpAnimatedView {
    self.backView = [[UIView alloc] initWithFrame:CGRectMake(0, ZJWinodwHeight - 400, ZJWinodwWidth, 400)];
    [self.backView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.backView];
    
}

- (void)textfieldView:(UIView<ZJPasswordViewProtocol> *)textfieldView
               result:(NSString *)result
            eventType:(ZJPasswordViewEventType)type {
    switch (type) {
        case ZJPasswordViewEventAutoDone: {
            NSLog(@"输入6位密码完成,<<%@>>",result);
            if (_dataModel.styleType == ZJPSWTextfieldViewWithAnimating) {
                [textfieldView showCircleAnimating];
                ZJAfter(2.f, ^{
                    [textfieldView stopCircleAnimating];
                    [textfieldView showCheckAnimation];
                });
            }
            else {
                [self showAlertTitle:@"输入密码完成" message:result okTitle:@"确定" okEvent:^{
                    [self.textfieldView clearAllInputChars];
                    [self.textfieldView makeTextfieldBecomeFirstResponder];
                }];
            }
        }
            break;
        case ZJPasswordViewEventOKButton: {
            NSLog(@"点击ToolBarView 使键盘下落");
        }
            break;
        case ZJPasswordViewEventLengthUpdate: {
            NSLog(@"输入变化");
        }
            break;
        case ZJPasswordViewAnimateViewFinish: {
            NSLog(@"支付完成,回到上一页");
            [self.navigationController popViewControllerAnimated:true];
        }
            break;
        default:
            break;
    }
}



- (void)showAlertTitle:(NSString *)title
               message:(NSString *)message
               okTitle:(NSString *)okTitle
               okEvent:(void(^)(void))okEvet{
    
    message = [NSString stringWithFormat:@"\n%@\n",message];
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    if ([okTitle length] >0) {
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:okTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            !okEvet ? : okEvet();
        }];
        [alertVC addAction:okAction];
    }
    
    [self.navigationController presentViewController:alertVC animated:true completion:nil];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    

}


@end
