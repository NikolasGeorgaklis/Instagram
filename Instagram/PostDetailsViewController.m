//
//  PostDetailsViewController.m
//  Instagram
//
//  Created by Nikolas Georgaklis on 6/30/22.
//

#import "PostDetailsViewController.h"

@interface PostDetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *postedImage;
@property (weak, nonatomic) IBOutlet UILabel *caption;
@property (weak, nonatomic) IBOutlet UILabel *timestamp;

@end

@implementation PostDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:self.post.image.url]];
    self.postedImage.image = [UIImage imageWithData:imageData];
    
    self.caption.text = self.post.caption;
    self.caption.text = [NSString stringWithFormat:@"%@ %@",
                         self.post.author.username, self.post.caption];
    
    NSMutableAttributedString *postText = [[NSMutableAttributedString alloc] initWithString:self.caption.text];
        NSRange boldRange = [self.caption.text rangeOfString:self.post.author.username];
        [postText addAttribute: NSFontAttributeName value:[UIFont boldSystemFontOfSize:16] range:boldRange];
        [self.caption setAttributedText: postText];
//        [self setTimestamp];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
