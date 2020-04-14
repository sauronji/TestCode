//
//  ViewController.m
//  TestApp
//
//  Created by tongyuan on 2019/10/2.
//  Copyright © 2019 tongyuan. All rights reserved.
//

#import "ViewController.h"
#import "TSNotification.h"
#import "TESTNotificaionCenter.h"
#import "TestView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    NSLog(@"===================class is %@", [self class]);
//    CoreText
//    NSNotification *note;
    TestView *testView = [[TestView alloc] initWithFrame:CGRectMake(0, 100, 400, 400)];
    testView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:testView];
    
    NSUserDefaults *userD = [NSUserDefaults standardUserDefaults];
    [userD setObject:@{@"one":@"jflsdjfls"} forKey:@"kMykey"];
    [userD synchronize];
//    NSTimer
//    self.view.layer.transform
//    [CAMediaTimingFunction functionWithControlPoints:<#(float)#> :<#(float)#> :<#(float)#> :<#(float)#>]
    // Do any additional setup after loading the view.
    
//    NSString *hh = [NSString stringWithFormat:@"%@%@%@", [self class], [super class]];
//    NSLog(@"%@======", hh);
    UIButton *one = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 200)];
    one.backgroundColor = [UIColor redColor];
    [one addTarget:self action:@selector(oneClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:one];
//
    UIButton *two = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 210, 210)];
    two.backgroundColor = [UIColor clearColor];
    [two addTarget:self action:@selector(twoClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:two];
//
//    two.layer.cornerRadius = 100;
//    two.layer.shadowColor = [UIColor grayColor].CGColor;
//    two.layer.shadowOffset = CGSizeMake(-3, -4);
//    two.layer.shadowRadius = 13;
//    two.layer.shadowOpacity = 0.9;
//
//    UIView *three = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
//    three.backgroundColor = [UIColor yellowColor];
//    three.layer.cornerRadius = 100;
//    three.layer.masksToBounds = YES;
//    [two addSubview:three];
//
//    [[TESTNotificaionCenter defaultCenter] addObserver:self selector:@selector(testNoti:) name:@"HHHHHHHTEst" object:@{@"test":@"hhhhhh"}];
//
//    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//    [[TESTNotificaionCenter defaultCenter] addObserverForName:@"jjjjjjtest" object:nil queue:queue usingBlock:^(TSNotification * _Nonnull note) {
//        NSLog(@"#################################");
//    }];
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    NSString *appCurVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    NSString *appCurVersionNum = [infoDictionary objectForKey:@"CFBundleVersion"];
    
    NSString *result = [self stringWithHexNumber:10];
    
    NSString *codie = [self versionCode];
}

- (NSString *)versionCode {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    NSArray *numberArray = [app_Version componentsSeparatedByString:@"."];
    NSString *middlePart = [numberArray objectAtIndex:1];
    NSString *midlleCode = [self stringWithHexNumber:middlePart.integerValue];
    
    return [NSString stringWithFormat:@"%@%@%@", [numberArray firstObject], midlleCode, [numberArray lastObject]];
}

- (NSString *)stringWithHexNumber:(NSUInteger)hexNumber{
    
    char hexChar[6];
    sprintf(hexChar, "%x", (int)hexNumber);
    
    NSString *hexString = [NSString stringWithCString:hexChar encoding:NSUTF8StringEncoding];
    
    if (hexNumber >=10 && hexNumber <= 16) {
        return [hexString uppercaseString];
    }
    return hexString;
}

- (void)oneClicked {
    [[TESTNotificaionCenter defaultCenter] postNotificationName:@"HHHHHHHTEst" object:nil];
    NSUserDefaults *userD = [NSUserDefaults standardUserDefaults];
    [userD setObject:@{@"two":@"77897r89"} forKey:@"kMykey"];
    [userD synchronize];
}

- (void)twoClicked {
    [[TESTNotificaionCenter defaultCenter] postNotificationName:@"jjjjjjtest" object:nil];
    NSUserDefaults *userD = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [userD objectForKey:@"kMykey"];
    
}

- (void)testNoti:(TSNotification *)note {
    NSLog(@"****************************");
}

@end
