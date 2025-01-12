//
//  RevenueCatAPI.m
//  MigrateTester
//
//  Created by Joshua Liebowitz on 6/18/21.
//

@import RevenueCat;
@import StoreKit;

#import "RCPurchasesAPI.h"

@implementation RCPurchasesAPI

bool canI;
NSString *version;

BOOL automaticAppleSearchAdsAttributionCollection;
BOOL debugLogsEnabled;
RCLogLevel logLevel;
NSURL *proxyURL;
BOOL forceUniversalAppStore;
BOOL simulatesAskToBuyInSandbox;
RCPurchases *sharedPurchases;
BOOL isConfigured;
BOOL allowSharingAppStoreAccount;
BOOL finishTransactions;
id<RCPurchasesDelegate> delegate;
NSString *appUserID;
BOOL isAnonymous;

+ (void)checkAPI {
    // TODO: iOS ONLY, TEST FOR THIS API BY LOOKING UP SELECTOR
    // [p presentCodeRedemptionSheet];
    RCPurchases *p = [RCPurchases configureWithAPIKey:@""];
    [RCPurchases configureWithAPIKey:@"" appUserID:@""];
    [RCPurchases configureWithAPIKey:@"" appUserID:@"" observerMode:false];
    [RCPurchases configureWithAPIKey:@"" appUserID:@"" observerMode:false userDefaults:nil];
    
    [RCPurchases setLogHandler:^(RCLogLevel l, NSString *i) {}];
    canI = [RCPurchases canMakePayments];
    version = [RCPurchases frameworkVersion];
    [RCPurchases addAttributionData:@{} fromNetwork:RCAttributionNetworkBranch];
    [RCPurchases addAttributionData:@{} fromNetwork:RCAttributionNetworkBranch forNetworkUserId:@""];
        
    automaticAppleSearchAdsAttributionCollection = [RCPurchases automaticAppleSearchAdsAttributionCollection];
    debugLogsEnabled = [RCPurchases debugLogsEnabled];
    logLevel = [RCPurchases logLevel];
    proxyURL = [RCPurchases proxyURL];
    forceUniversalAppStore = [RCPurchases forceUniversalAppStore];
    simulatesAskToBuyInSandbox = [RCPurchases simulatesAskToBuyInSandbox];
    sharedPurchases = [RCPurchases sharedPurchases];
    isConfigured = [RCPurchases isConfigured];
    allowSharingAppStoreAccount = [p allowSharingAppStoreAccount];
    finishTransactions = [p finishTransactions];
    delegate = [p delegate];
    appUserID = [p appUserID];
    isAnonymous = [p isAnonymous];
    
    RCPurchaserInfo *pi = nil;
    SKProduct *skp = [[SKProduct alloc] init];
    SKProductDiscount *skpd = [[SKProductDiscount alloc] init];
    SKPaymentDiscount *skmd = [[SKPaymentDiscount alloc] init];
    
    RCPackage *pack;

    [p invalidatePurchaserInfoCache];

    NSDictionary<NSString *, NSString *> *attributes = nil;
    [p setAttributes: attributes];
    [p setEmail: nil];
    [p setEmail: @""];
    [p setPhoneNumber: nil];
    [p setPhoneNumber: @""];
    [p setDisplayName: nil];
    [p setDisplayName: @""];
    [p setPushToken: nil];
    [p setPushToken: [@"" dataUsingEncoding: NSUTF8StringEncoding]];
    [p setAdjustID: nil];
    [p setAdjustID: @""];
    [p setAppsflyerID: nil];
    [p setAppsflyerID: @""];
    [p setFBAnonymousID: nil];
    [p setFBAnonymousID: @""];
    [p setMparticleID: nil];
    [p setMparticleID: @""];
    [p setOnesignalID: nil];
    [p setOnesignalID: @""];
    [p setMediaSource: nil];
    [p setMediaSource: @""];
    [p setCampaign: nil];
    [p setCampaign: @""];
    [p setAdGroup: nil];
    [p setAdGroup: @""];
    [p setAd: nil];
    [p setAd: @""];
    [p setKeyword: nil];
    [p setKeyword: @""];
    [p setCreative: nil];
    [p setCreative: @""];
    [p collectDeviceIdentifiers];
    
    [p purchaserInfoWithCompletionBlock:^(RCPurchaserInfo *info, NSError *error) {}];
    [p offeringsWithCompletionBlock:^(RCOfferings *info, NSError *error) {}];
    [p productsWithIdentifiers:@[@""] completionBlock:^(NSArray<SKProduct *> *products) { }];
    [p purchaseProduct:skp withCompletionBlock:^(SKPaymentTransaction *t, RCPurchaserInfo *i, NSError *error, BOOL userCancelled) { }];
    [p purchasePackage:pack withCompletionBlock:^(SKPaymentTransaction *t, RCPurchaserInfo *i, NSError *e, BOOL userCancelled) { }];
    [p restoreTransactionsWithCompletionBlock:^(RCPurchaserInfo *i, NSError *e) {}];
    [p syncPurchasesWithCompletionBlock:^(RCPurchaserInfo *i, NSError *e) {}];
    [p checkTrialOrIntroductoryPriceEligibility:@[@""] completionBlock:^(NSDictionary<NSString *,RCIntroEligibility *> *d) { }];
    [p paymentDiscountForProductDiscount:skpd product:skp completion:^(SKPaymentDiscount *d, NSError *e) { }];
    [p purchaseProduct:skp withDiscount:skmd completionBlock:^(SKPaymentTransaction *t, RCPurchaserInfo *i, NSError *e, BOOL userCancelled) { }];
    [p purchasePackage:pack withDiscount:skmd completionBlock:^(SKPaymentTransaction *t, RCPurchaserInfo *i, NSError *e, BOOL userCancelled) { }];
    
    [p createAlias:@"" completionBlock:^(RCPurchaserInfo *i, NSError *e) { }];
    [p identify:@"" completionBlock:^(RCPurchaserInfo *i, NSError *e) { }];
    [p resetWithCompletionBlock:^(RCPurchaserInfo *i, NSError *e) { }];

    [p logIn:@"" completionBlock:^(RCPurchaserInfo *i, BOOL created, NSError *e) { }];
    [p logOutWithCompletionBlock:^(RCPurchaserInfo *i, NSError *e) { }];

    [p.delegate purchases:p didReceiveUpdatedPurchaserInfo:pi];
    [p.delegate purchases:p
shouldPurchasePromoProduct:skp
           defermentBlock:^(void (^ _Nonnull completion)(SKPaymentTransaction * _Nullable transaction,
                                                         RCPurchaserInfo * _Nullable info,
                                                         NSError * _Nullable error,
                                                         BOOL cancelled)) {}];
}

+ (void)checkEnums {
    RCPeriodType t = RCNormal;
    t = RCIntro;
    t = RCTrial;
    
    RCPurchaseOwnershipType o = RCPurchaseOwnershipTypePurchased;
    o = RCPurchaseOwnershipTypeFamilyShared;
    o = RCPurchaseOwnershipTypeUnknown;
    
    RCLogLevel l = RCLogLevelInfo;
    l = RCLogLevelWarn;
    l = RCLogLevelDebug;
    l = RCLogLevelError;
    
}

+ (void)checkConstants {
// TODO convert back once everything moved into Purchases
    double vn = RevenueCatVersionNumber;
    const unsigned char *vs = RevenueCatVersionString;

    // breaking changes below this line
    NSErrorDomain bed = RCBackendErrorCodeDomain;
    NSErrorDomain ped = RCPurchasesErrorCodeDomain;
    NSErrorUserInfoKey fk = RCErrorDetails.RCFinishableKey;
    NSErrorUserInfoKey eck = RCErrorDetails.RCReadableErrorCodeKey;

    NSLog([NSString stringWithFormat:@"%lf", vn], vs, bed, ped, fk, eck);
}

@end
