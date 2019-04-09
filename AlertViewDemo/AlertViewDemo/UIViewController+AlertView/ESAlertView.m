//
//  ESAlertView.m
//  ThriftShop
//
//

#import "ESAlertView.h"
#import "UIView+PPCategory.h"

@implementation ESAlertView {
    UIView *contentView;
}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:@"AlertView" owner:self options:nil];
        contentView = [nibContents lastObject];
    
        [self.defaultButton addTarget:self action:@selector(firstButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.secondButton addTarget:self action:@selector(secondButton:) forControlEvents:UIControlEventTouchUpInside];
        
        [self setAutoresizesSubviews:NO];
        
        contentView.layer.cornerRadius = 6;
        
        [self addSubview:contentView];
    }
    return self;
}

- (CGFloat)getLabelTextHeight:(NSString*)text
                  labelWidth:(NSInteger)labelWidth
               labelFontSize:(NSInteger)labelFontSize
                 lineSpacing:(NSInteger)lineSpacing {
    if (text == nil || [text isEqualToString:@""]) {
        return 0.0;
    }
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineSpacing = lineSpacing;
    
    NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:labelFontSize],
                           NSParagraphStyleAttributeName:paragraphStyle
                           };
    
    CGSize labelSize =  [text boundingRectWithSize:CGSizeMake(labelWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    
    if (labelSize.height < labelFontSize * 2) {
        NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:labelFontSize]
                               };
        
        labelSize =  [text boundingRectWithSize:CGSizeMake(labelWidth, MAXFLOAT) options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine) attributes:dict context:nil].size;
    }
    
    return labelSize.height + 1;
}

- (void)setLabelText:(UILabel*)label
               text:(NSString*)text
         labelWidth:(NSInteger)labelWidth
      labelFontSize:(NSInteger)labelFontSize
        lineSpacing:(NSInteger)lineSpacing
          alignment:(NSTextAlignment)alignment {
    if (label == nil || text == nil || [text isEqualToString:@""]) {
        return;
    }
    
    label.numberOfLines = 0;
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:labelFontSize],
                           NSParagraphStyleAttributeName:paragraphStyle
                           };
    
    CGSize labelSize =  [text boundingRectWithSize:CGSizeMake(labelWidth, MAXFLOAT) options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine) attributes:dict context:nil].size;
    
    if (labelSize.height > labelFontSize * 2) {
        paragraphStyle.lineSpacing = lineSpacing;
    }
    
    
    paragraphStyle.alignment = alignment;
    
    NSDictionary *attribute = @{NSFontAttributeName:label.font, NSParagraphStyleAttributeName:paragraphStyle};
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:text];
    [str addAttributes:attribute range:NSMakeRange(0, text.length)];
    [str addAttribute:NSForegroundColorAttributeName value:[label textColor] range:NSMakeRange(0,2)];
    label.attributedText = str;
}


- (void)setViewData:(NSString *)mainTitle
          subTitle:(NSString *)subTitle
   defaultBtnTitle:(NSString *)defaultBtnTitle
    secondBtnTitle:(NSString *)secondBtnTitle
               pic:(NSString *)pic
          picWidth:(NSInteger)picWidth
         picHeight:(NSInteger)picHeight{
    
    NSInteger viewHeight = 64, viewWidth = 270;
    
    NSInteger labelWidth = 270 - self.subRightConstraint.constant * 2;
    if (pic || [pic isEqualToString:@""]) {
        labelWidth = 270 - 15 * 2;
    }
    
    NSInteger lineSpace = 7;
    NSInteger firstLabelHeight = 0;
    NSArray *strArry = [mainTitle componentsSeparatedByString:@"\n"];
    for (int i = 0 ; i < [strArry count]; i++) {
        NSInteger temp =  [self getLabelTextHeight:[strArry objectAtIndex:i] labelWidth:labelWidth labelFontSize:14 lineSpacing:lineSpace];
        firstLabelHeight = temp + firstLabelHeight + 7;

    }
    
    NSInteger secondLabelHeight = [self getLabelTextHeight:subTitle labelWidth:labelWidth labelFontSize:12 lineSpacing:lineSpace];
    
    if (mainTitle && ![mainTitle isEqualToString:@""]) {
        viewHeight += firstLabelHeight + 20;
        
        [self setLabelText:self.mainTitleLabel text:mainTitle labelWidth:labelWidth labelFontSize:14 lineSpacing:lineSpace alignment:NSTextAlignmentCenter];
        
        self.mainLabeleHeight.constant = firstLabelHeight ;
    } else {//没有主标题
        [self.mainTitleLabel removeFromSuperview];
    }
    
    if (secondLabelHeight > 0) {
        viewHeight += secondLabelHeight + 10;
        [self setLabelText:self.subTitleLabel text:subTitle labelWidth:labelWidth labelFontSize:12 lineSpacing:lineSpace alignment:NSTextAlignmentCenter];
        self.secondLabelHeight.constant = secondLabelHeight;
    } else {//没有副标题
        [self.subTitleLabel removeFromSuperview];
    }
    
    if (pic && ![pic isEqualToString:@""]) {
        viewHeight += picHeight + 10;
        self.picHeight.constant = picHeight;
        self.picWidth.constant = picWidth;
        
        [self.picImageView setImage:[UIImage imageNamed:pic]];
    } else {//没有图片
        [self.picImageView removeFromSuperview];
        
        self.subLeftConstraint.constant = 15;
        self.subRightConstraint.constant = 15;
    }
    
    
    [self.defaultButton setTitle:defaultBtnTitle forState:UIControlStateNormal];
    [self.secondButton setTitle:secondBtnTitle forState:UIControlStateNormal];
    
    if (secondBtnTitle && ![secondBtnTitle isEqualToString:@""]) {
        self.firstButtonWidth.constant = viewWidth / 2;
        self.secondButtonWidth.constant = viewWidth / 2;
    } else {
        self.firstButtonWidth.constant = viewWidth;
        self.secondButtonWidth.constant = 0;
        self.secondButton.hidden = YES;
        [self.vImageLine removeFromSuperview];
    }
    
    [contentView setHeight:viewHeight];
    
    [self setFrame:contentView.frame];
    [self setNeedsDisplay];
}

- (IBAction)firstButton:(id)sender {
    [self.delegate firstButtonDelegate];
}

- (IBAction)secondButton:(id)sender {
    [self.delegate secondButtonDelegate];
}


-(void)updateESUI{
    self.subTitleLabel.textAlignment = NSTextAlignmentLeft;
    self.mainTitleLabel.textAlignment = NSTextAlignmentLeft;
}

@end

