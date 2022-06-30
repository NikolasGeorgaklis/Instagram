//
//  HomeViewController.m
//  Instagram
//
//  Created by Nikolas Georgaklis on 6/27/22.
//

#import "SceneDelegate.h"
#import "HomeViewController.h"
#import "LoginViewController.h"
#import <Parse/Parse.h>
#import "PostCell.h"
#import "PhotoMapViewController.h"

@interface HomeViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic)NSArray *postsArray;
@property (strong, nonatomic)UIRefreshControl *refreshControl;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self getPosts];
    
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(getPosts) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:self.refreshControl atIndex:0];
}

- (IBAction)logOut:(id)sender {
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        // PFUser.current() will now be nil
        NSLog(@"Logged out");
    }];
    SceneDelegate *sceneDelegate = (SceneDelegate *)self.view.window.windowScene.delegate;

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    sceneDelegate.window.rootViewController = loginViewController;
}

-(void)getPosts{
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
   // [query includeKey:@"author"];
//    [query includeKey:@"createdAt"];
//    [query includeKey:@"likeCount"];
    [query orderByDescending:@"createdAt"];
    
    
    query.limit = 20;

    // fetch data asynchronously
    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts != nil) {
            // do something with the array of object returned by the call
            self.postsArray = posts;
            [self.tableView reloadData];
            NSLog(@"%@", self.postsArray);
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
        [self.refreshControl endRefreshing];
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PostCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostCell" forIndexPath:indexPath];
    cell.post = self.postsArray[indexPath.row];
    
    [cell setPost];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.postsArray.count;
}

/*

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([[segue identifier] isEqualToString:@"composeSegue"]){
        UINavigationController *navigationController = [segue destinationViewController];
        PhotoMapViewController *photoController = (PhotoMapViewController*)navigationController.topViewController;
        photoController.delegate = self;
    }
}
*/


@end
