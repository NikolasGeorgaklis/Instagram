//
//  PostDetailsViewController.h
//  Instagram
//
//  Created by Nikolas Georgaklis on 6/30/22.
//

#import <UIKit/UIKit.h>
#import "Post.h"

NS_ASSUME_NONNULL_BEGIN

@interface PostDetailsViewController : UIViewController

@property (weak, nonatomic) Post *post;

@end

NS_ASSUME_NONNULL_END
