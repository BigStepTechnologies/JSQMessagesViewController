//
//  Created by Jesse Squires
//  http://www.jessesquires.com
//
//
//  Documentation
//  http://cocoadocs.org/docsets/JSQMessagesViewController
//
//
//  GitHub
//  https://github.com/jessesquires/JSQMessagesViewController
//
//
//  License
//  Copyright (c) 2014 Jesse Squires
//  Released under an MIT license: http://opensource.org/licenses/MIT
//

#import "JSQMessagesToolbarButtonFactory.h"

#import "UIColor+JSQMessages.h"
#import "UIImage+JSQMessages.h"
#import "NSBundle+JSQMessages.h"

@interface JSQMessagesToolbarButtonFactory ()

@property (strong, nonatomic, readonly) UIFont *buttonFont;

@end

@implementation JSQMessagesToolbarButtonFactory

- (instancetype)init
{
    return [self initWithFont:[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline]];
}

- (instancetype)initWithFont:(UIFont *)font
{
    NSParameterAssert(font != nil);
    
    self = [super init];
    if (self) {
        _buttonFont = font;
    }
    
    return self;
}

- (UIButton *)defaultAccessoryButtonItem
{
    UIImage *accessoryImage = [UIImage jsq_defaultAccessoryImage];
    UIImage *normalImage = [accessoryImage jsq_imageMaskedWithColor:[UIColor lightGrayColor]];
    UIImage *highlightedImage = [accessoryImage jsq_imageMaskedWithColor:[UIColor darkGrayColor]];

    UIButton *accessoryButton = [[UIButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 40.f, 40.0f)];
    [accessoryButton setImage:normalImage forState:UIControlStateNormal];
    [accessoryButton setImage:highlightedImage forState:UIControlStateHighlighted];

    accessoryButton.contentMode = UIViewContentModeScaleAspectFit;
    accessoryButton.backgroundColor = [UIColor clearColor];
    accessoryButton.tintColor = [UIColor lightGrayColor];
    accessoryButton.titleLabel.font = self.buttonFont;
    
    accessoryButton.accessibilityLabel = [NSBundle jsq_localizedStringForKey:@"accessory_button_accessibility_label"];

    return accessoryButton;
}

- (UIButton *)defaultSendButtonItem
{
    UIImage *sendImage = [UIImage jsq_defaultSendButtonImage];
    UIImage *normalImage = [sendImage jsq_imageMaskedWithColor:[UIColor lightGrayColor]];
    UIImage *highlightedImage = [sendImage jsq_imageMaskedWithColor:[UIColor jsq_messageBubbleBlueColor]];
    
    UIButton *sendButton = [[UIButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 40.0f, 40.0f)];
    [sendButton setImage:normalImage forState:UIControlStateDisabled];
    [sendButton setImage:highlightedImage forState:UIControlStateNormal];
    [sendButton setImage:highlightedImage forState:UIControlStateHighlighted];
    
    sendButton.contentMode = UIViewContentModeScaleAspectFit;
    sendButton.backgroundColor = [UIColor clearColor];
    sendButton.tintColor = [UIColor jsq_messageBubbleBlueColor];


    return sendButton;
}

@end
