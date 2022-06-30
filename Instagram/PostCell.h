//
//  PostCell.h
//  Instagram
//
//  Created by Nikolas Georgaklis on 6/29/22.
//

#import <UIKit/UIKit.h>
#import "Post.h"
@import Parse;

NS_ASSUME_NONNULL_BEGIN

@interface PostCell : UITableViewCell

@property (strong, nonatomic) IBOutlet PFImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UILabel *caption;

@property (strong, nonatomic) Post *post;
- (void) setPost;

@end

NS_ASSUME_NONNULL_END
