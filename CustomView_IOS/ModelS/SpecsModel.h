//
//  SpecsModel.h
//  CustomView_IOS
//
//  Created by 恒善信诚科技有限公司 on 16/11/8.
//
//

#import <Foundation/Foundation.h>

@interface SpecsModel : NSObject

@property (nonatomic,strong) NSString * specsName;

@property (nonatomic,strong) NSString * money;

@property (nonatomic,assign) NSInteger specsid; //规格id

@end


@interface LayoutModel : NSObject

@property (nonatomic,strong) NSString * image;

@property (nonatomic,strong) NSString * title;

@property (nonatomic,assign) NSInteger pid;

@property (nonatomic,strong) NSString * clasStr;

@end
