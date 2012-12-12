//
//  DateListViewController.m
//  table
//
//  Created by 礒井 友香 on 2012/12/05.
//  Copyright (c) 2012年 礒井 友香. All rights reserved.
//

#import "DateListViewController.h"

@interface DateListViewController()
{
    NSDate *_now;
    
    NSCalendar *_calendar;
    NSDateComponents *_date;
    
    NSInteger _today;
}
@end

@implementation DateListViewController

const NSString *ArrWeek[] = {@"日", @"月", @"火", @"水", @"木", @"金", @"土"};

-(void)viewDidLoad
{
    _now = [NSDate date];
    
    _calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    _date= [_calendar components:unitFlags fromDate:_now];
    
    _today = _date.day;
}

- (void)awakeFromNib
{
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSInteger daysOfThisMonth = [calendar rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:_now].length;
    
    return daysOfThisMonth;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    NSInteger day = (indexPath.row) + 1;

    // weekday
    [_date setDay:day];
    NSDate *lineDate = [_calendar dateFromComponents:_date];
    NSDateComponents *date = [_calendar components:NSWeekdayCalendarUnit fromDate:lineDate];
    NSInteger weekday = [date weekday] - 1; // 0=sunday,6=saturday
    
        
    cell.textLabel.text = [NSString stringWithFormat:@"%d/%d/%d(%@)", _date.year, _date.month, day, ArrWeek[weekday]];
    
    // selected cell color
    UIView *backgroundView = [[UIView alloc] init];
    backgroundView.backgroundColor = [UIColor greenColor];
    cell.selectedBackgroundView = backgroundView;
    
    // today cell color
    UIColor *color = [UIColor whiteColor];
    if (day == _today) {
        color = [UIColor colorWithRed:1.0 green:0.647 blue:0.0 alpha:1.0];
    }
    cell.contentView.backgroundColor = color;
    
    return cell;
}

@end
