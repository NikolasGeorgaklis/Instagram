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
        [self setTimestamp];
    
}
- (void)setTimestamp {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // Configure the input format to parse the date string
    formatter.dateFormat = @"E MMM d HH:mm:ss Z y";
    // Convert String to Date
    NSDate *date = self.post.createdAt;
    // Configure output format
    formatter.dateStyle = NSDateFormatterShortStyle;
    formatter.timeStyle = NSDateFormatterNoStyle;

    NSDate *curDate = [NSDate date];
    NSTimeInterval diff = [curDate timeIntervalSinceDate:date];

    //format the created string based on if it was posted an hour or more ago or a minute or more ago
    NSInteger interval = diff;
    long minutes = (interval / 60) % 60;
    long hours = (interval / 3600);
    NSDateComponentsFormatter *formatter2 = [[NSDateComponentsFormatter alloc] init];
        formatter2.unitsStyle = NSDateComponentsFormatterUnitsStyleFull;
//        formatter2.allowedUnits = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
        
        
    if (hours > 24)
    {
        formatter2.allowedUnits = NSCalendarUnitDay;
    }
    else if(hours > 1) {
        formatter2.allowedUnits = NSCalendarUnitHour;
        
    } else if(minutes > 1) {
        formatter2.allowedUnits = NSCalendarUnitMinute;
    } else {
        formatter2.allowedUnits = NSCalendarUnitSecond;
    }
    NSString *elapsed = [formatter2 stringFromDate:date toDate:[NSDate date]];
    self.timestamp.text = [NSString stringWithFormat:@"%@ ago", elapsed];
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
