//
//  ViewController.h
//  SimpleTable
//
//  Created by user148840 on 1/29/19.
//  Copyright © 2019 user148840. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    
    
    IBOutlet UITableView *myTable;
    NSArray *recipes;
    NSArray *image;
    NSUInteger index;
}



@end



