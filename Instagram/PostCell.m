//
//  PostCell.m
//  Instagram
//
//  Created by Nikolas Georgaklis on 6/29/22.
//

#import "PostCell.h"

@implementation PostCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setPost {
    NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:self.post.image.url]];
    self.photoImageView.image = [UIImage imageWithData:imageData];
    
    self.caption.text = self.post.caption;
    self.caption.text = [NSString stringWithFormat:@"%@ %@",
                         self.post.author.username, self.post.caption];
    
    NSMutableAttributedString *postText = [[NSMutableAttributedString alloc] initWithString:self.caption.text];
        NSRange boldRange = [self.caption.text rangeOfString:self.post.author.username];
        [postText addAttribute: NSFontAttributeName value:[UIFont boldSystemFontOfSize:16] range:boldRange];
        [self.caption setAttributedText: postText];
    
//    self.photoImageView.file = self.post[@"image"];
//    [self.photoImageView loadInBackground];
}


@end
