//
//  mqttitudeEditLocationTVC.m
//  mqttitude
//
//  Created by Christoph Krey on 01.10.13.
//  Copyright (c) 2013 Christoph Krey. All rights reserved.
//

#import "mqttitudeEditLocationTVC.h"
#import "Friend+Create.h"

@interface mqttitudeEditLocationTVC ()
@property (weak, nonatomic) IBOutlet UITableViewCell *remarkCell;
@property (weak, nonatomic) IBOutlet UITextField *UItimestamp;
@property (weak, nonatomic) IBOutlet UITextField *UIcoordinate;
@property (weak, nonatomic) IBOutlet UITextView *UIplace;
@property (weak, nonatomic) IBOutlet UITextField *UIremark;

@end

@implementation mqttitudeEditLocationTVC

- (void)setLocation:(Location *)location
{
    _location = location;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.title = [self.location nameText];
    
    self.UIcoordinate.text = [self.location coordinateText];
    
    self.UItimestamp.text = [self.location timestampText];
    
    self.UIplace.text = self.location.placemark;
    self.UIremark.text = self.location.remark;
    }

- (IBAction)remarkchanged:(UITextField *)sender {
    self.location.remark = sender.text;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        if ([self.location.automatic boolValue]) {
            return 0;
        } else {
            return 1;
        }
    } else {
        return 3;
    }
}

@end
