//
//  JWScrollviewCell.m
//  CustomView_IOS
//
//  Created by 梁家文 on 16/9/16.
//
//

#import "JWScrollviewCell.h"
#import "UIView+Extension.h"
#import "JWKitMacro.h"

@interface JWScrollviewCell ()

@property (nonatomic,strong) JWLabel * upLine;

@property (nonatomic,strong) JWLabel * downLine;

@property (nonatomic,strong) UIImageView * rightImage;

@end

@implementation JWScrollviewCell

-(UIImageView *)rightImage{
    if (!_rightImage) {
        _rightImage = [[UIImageView alloc]initWithFrame:CGRectMake(self.width-(15+8), (self.height - 13)/2, 8, 13)];
        _rightImage.image = [UIImage imageNamed:@"arrow_forward"];
        [self addSubview:_rightImage];
    }
    return _rightImage;
}

-(UIView *)contentView{
    
    if (!_contentView) {
        _contentView = [[UIView alloc]init];
        _contentView.backgroundColor = [UIColor whiteColor];
    }
    return _contentView;
    
}

-(JWLabel *)leftLabel{
    
    if (!_leftLabel) {
        _leftLabel = [[JWLabel alloc]initWithFrame:CGRectMake(20, 0, kScreenWidth-40, self.contentView.height)];
        [self.contentView addSubview:_leftLabel];
    }
    return _leftLabel;
}

-(JWTextField *)rightTextField{
    if (!_rightTextField) {
        _rightTextField = [[JWTextField alloc]initWithFrame:CGRectMake(20, 0, kScreenWidth-40, self.contentView.height)];
        _rightTextField.textAlignment = 2;
        [self.contentView addSubview:_rightTextField];
    }
    return _rightTextField;
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        self.height = frame.size.height + 2;
        self.upLine = [JWLabel addLineLabel:CGRectMake(0, 0, kScreenWidth, 1)];
        [self addSubview:self.upLine];
        self.downLine = [JWLabel addLineLabel:CGRectMake(0, self.height-1, kScreenWidth, 1)];
        [self addSubview:self.downLine];
        
        self.contentView.frame = CGRectMake(0, CGRectGetMaxY(self.upLine.frame), kScreenWidth, self.height-self.upLine.height - self.downLine.height);
        [self addSubview:self.contentView];
        
    }
    return self;
}

-(void)setUPSpacing:(CGFloat)upSpacing andDownSpacing:(CGFloat)downSpacing{
    
    self.upLine.height  = upSpacing;
    
    self.downLine.height = downSpacing;
    
    [self refreshSubviews];
}

-(void)refreshSubviews{
    self.contentView.y = CGRectGetMaxY(self.upLine.frame);
    self.downLine.y = CGRectGetMaxY(self.contentView.frame);
    self.height = CGRectGetMaxY(self.downLine.frame);
}

-(void)setLineColor:(UIColor *)lineColor{
    
    self.downLine.backgroundColor =self.upLine.backgroundColor = lineColor;
    
}

-(void)setAccessoryType:(CellAccessoryType)accessoryType{

    if (accessoryType==JWCellAccessoryDisclosureIndicator) {
        self.rightImage.hidden =false;
        _rightTextField.x = _rightTextField.x - self.rightImage.width;
    }else{
        self.rightImage.hidden = true;
        _rightTextField.x = 20;
    }
    
}

@end
