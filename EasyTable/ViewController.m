//
//  ViewController.m
//  SimpleTable
//
//  Created by user148840 on 1/29/19.
//  Copyright © 2019 user148840. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
      NSArray *searchResults;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    recipes = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];
    image = [NSArray arrayWithObjects:@"a.png",@"b.png",@"c.png",@"d.png",@"a.png",@"b.png",@"c.png",@"d.png",@"a.png",@"b.png",@"c.png",@"d.png",@"a.png",@"b.png",@"c.png",@"d.png",@"d.png", nil];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
        
    } else {
        return [recipes count];
        
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    simpleTableIdentifier = [NSString stringWithFormat:@"Row_%d", (int)indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    ViewController *temp;
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
       
    }
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
       
        
        NSPredicate *resultPredicate = [NSPredicate
                                        predicateWithFormat:@"SELF contains[cd] %@",
                                        [searchResults objectAtIndex:indexPath.row]];
        
        
        //NSPredicate *exists = [NSPredicate predicateWithFormat: @"%K MATCHES[c] %@", key, value];
        index = [recipes indexOfObjectPassingTest:
                 ^(id obj, NSUInteger idx, BOOL *stop) {
                     return [resultPredicate evaluateWithObject:obj];
                 }];
        
        //temp=[searchResults objectAtIndex:indexPath.row];
        cell.textLabel.text = [searchResults objectAtIndex:indexPath.row];
        cell.imageView.image=[UIImage imageNamed:[image objectAtIndex:index]];
    } else {
       temp=[recipes objectAtIndex:indexPath.row];
        cell.textLabel.text = [recipes objectAtIndex:indexPath.row];
        cell.imageView.image=[UIImage imageNamed:[image objectAtIndex:indexPath.row]];
        
    }
   
    
    return cell;
}
- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate
                                    predicateWithFormat:@"SELF contains[cd] %@",
                                    searchText];
    
    searchResults = [recipes filteredArrayUsingPredicate:resultPredicate];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller
shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    
    return YES;
}
@end
