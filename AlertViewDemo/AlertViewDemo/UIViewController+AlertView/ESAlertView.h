//
//  ESAlertView.h
//  ThriftShop
//
//

#import <UIKit/UIKit.h>

@protocol ESAlertViewButtonDelegate
-(void)firstButtonDelegate;
-(void)secondButtonDelegate;
@end

@interface ESAlertView : UIView

@property (weak, nonatomic) id<ESAlertViewButtonDelegate> delegate;

@property (weak, nonatomic) IBOutlet UILabel *mainTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *picImageView;
@property (weak, nonatomic) IBOutlet UIButton *defaultButton;
@property (weak, nonatomic) IBOutlet UIButton *secondButton;
@property (weak, nonatomic) IBOutlet UIImageView *vImageLine;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *secondButtonWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *firstButtonWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *picWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *picHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *subLeftConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *subRightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *mainLabeleHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *secondLabelHeight;

-(void)setViewData:(NSString *)mainTitle
          subTitle:(NSString *)subTitle
   defaultBtnTitle:(NSString *)defaultBtnTitle
    secondBtnTitle:(NSString *)secondBtnTitle
               pic:(NSString *)pic
          picWidth:(NSInteger)picWidth
         picHeight:(NSInteger)picHeight;

-(void)updateESUI;

@end
