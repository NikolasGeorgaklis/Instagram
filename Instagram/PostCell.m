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
    
//    self.photoImageView.file = self.post[@"image"];
//    [self.photoImageView loadInBackground];
}


@end
