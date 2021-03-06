//
//  TTListViewController.m
//  Time-Tracker
//
//  Created by Douglas Voss on 5/14/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "TTListViewController.h"
#import "DetailViewController.h"
#import "ProjectController.h"

@interface TTListViewController ()

@end

@implementation TTListViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.dataSource = [TTListTableViewDatasource new];
        self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
        self.tableView.dataSource = self.dataSource;
        [self.view addSubview:self.tableView];
        self.tableView.delegate = self;
        self.view.backgroundColor = [UIColor redColor];
        self.tableView.backgroundColor = [UIColor blueColor];
        
        UIBarButtonItem *addButton = [[UIBarButtonItem alloc]
                                      initWithTitle:@"Add"
                                      style:UIBarButtonSystemItemAdd
                                      target:self
                                      action:@selector(addButtonMethod)];
        
        self.navigationItem.rightBarButtonItem = addButton;
    }
    return self;
}

-(void)addButtonMethod
{
    DetailViewController *dvc = [DetailViewController new];
    
    ProjectController *projectController = [ProjectController sharedInstance];
    Project *newProject = [Project new];
    newProject.title = @"Rename Me";
    [projectController addProject:newProject];
    dvc.project = newProject;

    [self.navigationController pushViewController:dvc animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *dvc = [DetailViewController new];
    ProjectController *pc = [ProjectController sharedInstance];
    
    dvc.project = pc.projectArray[indexPath.row];
    [self.navigationController pushViewController:dvc animated:YES];
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
