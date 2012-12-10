//
//  MasterViewController.m
//  table
//
//  Created by 礒井 友香 on 2012/12/05.
//  Copyright (c) 2012年 礒井 友香. All rights reserved.
//

#import "MasterViewController.h"

@interface MasterViewController () {
    NSDate *_now;
}
@end

@implementation MasterViewController

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
    _now = [NSDate date];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSInteger daysOfThisMonth = [calendar rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:_now].length;
    
    return daysOfThisMonth;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger calendarFlag;
    NSDateComponents *dateComps;
    
    // year,month,day
    calendarFlag = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    dateComps = [calendar components:calendarFlag fromDate:_now];
    
    NSInteger year = dateComps.year;
    NSInteger month = dateComps.month;
    NSInteger today = dateComps.day;
    NSInteger day = (indexPath.row) + 1;

    // weekday
    [dateComps setDay:1];
    NSDate *date = [calendar dateFromComponents:dateComps];
    dateComps = [calendar components:NSWeekdayCalendarUnit fromDate:date];
    NSInteger firstWeekday = [dateComps weekday] - 1; // 月初めの曜日
    
    NSInteger weekday = (firstWeekday + (indexPath.row)) % 7; // 行の曜日
    
    NSString *arr_week[] = {@"日", @"月", @"火", @"水", @"木", @"金", @"土"};
    NSString *youbi = arr_week[weekday];
    
    static NSString *CellIdentifier = @"Cell"; 
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // cell text
    cell.textLabel.text = [NSString stringWithFormat:@"%d/%d/%d(%@)", year, month, day, youbi];
    
    // selected cell color
    UIView *backgroundView = [[UIView alloc] init];
    backgroundView.backgroundColor = [UIColor greenColor];
    cell.selectedBackgroundView = backgroundView;
    
    // today cell color
    UIColor *color = [UIColor whiteColor];
    if (indexPath.row == today - 1) { // 今日の日付の行なら色を変更
        color = [UIColor colorWithRed:1.0 green:0.647 blue:0.0 alpha:1.0];
    }
    cell.contentView.backgroundColor = color;
    
    return cell;
}

@end
