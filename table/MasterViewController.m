//
//  MasterViewController.m
//  table
//
//  Created by 礒井 友香 on 2012/12/05.
//  Copyright (c) 2012年 礒井 友香. All rights reserved.
//

#import "MasterViewController.h"

@interface MasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}
/*- (void)viewDidLoad
{
 
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}*/



#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // return _objects.count;
    
    /* 今の時刻を取得する */
    
    NSDate *now = [NSDate date];
    
    /* NSCalendarを取得する */
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier: NSGregorianCalendar];;
    
    NSInteger daysOfThisMonth = [ calendar rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:now ].length;
    
    return daysOfThisMonth;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    UIView *backgroundView = [[UIView alloc] init];
    backgroundView.backgroundColor = [UIColor greenColor];
    cell.selectedBackgroundView = backgroundView;
                                   
    /* 今の時刻を取得する */
    NSDate *now = [NSDate date];
       
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger flags;
    NSDateComponents *comps;
    
    // 年・月・日を取得
    flags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    comps = [calendar components:flags fromDate:now];
    
    NSInteger year = comps.year;
    NSInteger month = comps.month;
    NSInteger today = comps.day;
    NSInteger day = (indexPath.row) + 1;
    
    
    
    

    // 曜日
    [comps setDay:1];
    NSDate *date = [calendar dateFromComponents:comps];
    comps = [calendar components:NSWeekdayCalendarUnit fromDate:date];
    NSInteger firstWeekday = [comps weekday] - 1;
    
    NSInteger weekday = (firstWeekday + (indexPath.row)) % 7;
    
    NSString *arr_week[] = {@"日", @"月", @"火", @"水", @"木", @"金", @"土"};
    NSString *youbi = arr_week[weekday];
     
    
    cell.textLabel.text = [NSString stringWithFormat:@"%d/%d/%d(%@)", year, month, day, youbi];
    
    
    if(indexPath.row == today-1){
        UIColor *color = [UIColor colorWithRed:1.0 green:0.647 blue:0.0 alpha:1.0];
        cell.contentView.backgroundColor = color;
    } else {
        UIColor *color = [UIColor whiteColor];
        cell.contentView.backgroundColor = color;
    }
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

@end
