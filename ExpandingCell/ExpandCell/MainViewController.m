//
//  MainViewController.m
//  CustomDetailTable
//
//  Created by Mitul Bhadesiya on 29/01/14.
//  Copyright (c) 2014 logistic. All rights reserved.
//

#import "MainViewController.h"

#import "MyCustomCell.h"

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize mainTable;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    dataArray  = @[@"List 1" , @"List 2" , @"List 3" , @"List 4", @"List 5"];
    
 
    NSArray *data1 = @[@"detail 1 " , @"detail 2" , @"List 3" , @"List 4", @"List 5"];
    NSArray *data2 = @[@"myapps " , @"your apps " , @"etc"];
    NSArray *data3 = @[@"myapps " , @"apps " , @"etc"];
    NSArray *data4 = @[@"myapp your arp " , @"apps  crea" , @"etc"];
    NSArray *data5 = @[@"myapps " , @"your apps " , @"etc"];
    
    mDetailArray = [[NSMutableArray alloc]init];
    
    [mDetailArray addObject:data1];
    [mDetailArray addObject:data2];
    [mDetailArray addObject:data3];
    [mDetailArray addObject:data4];
    [mDetailArray addObject:data5];
    
    //[mainTable setEditing:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"COUNT : %@ " , dataArray);
    
    return [dataArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    

    static NSString *simpleTableIdentifier = @"MyCustomCell";
    
    MyCustomCell *cell = (MyCustomCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MyCustomCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.label.text = [dataArray objectAtIndex:indexPath.row];
    cell.DetailArray = [mDetailArray objectAtIndex:indexPath.row];
    
    if(selectedIndex == indexPath.row)
    {
        cell.cellTable.hidden = NO;
        cell.label.hidden = YES;
    }
    else {
        cell.cellTable.hidden = YES;
        cell.label.hidden = NO;
    }
    if(!self.isGroupsEditable)
        [cell.cellTable setEditing:YES];
    else
         [cell.cellTable setEditing:NO];
    return cell;
}
// Individual rows can opt out of having the -editing property set for them. If not implemented, all rows are assumed to be editable.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

// Moving/reordering

// Allows the reorder accessory view to optionally be shown for a particular row. By default, the reorder control will be shown only if the datasource implements -tableView:moveRowAtIndexPath:toIndexPath:
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
        return UITableViewCellEditingStyleNone;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(selectedIndex == indexPath.row)
    {
        return 250;
    }else {
        return 60;
    }
}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    return indexPath;
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    if(selectedIndex == indexPath.row)
    {
        selectedIndex = -1;
        [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        return;
    }
    
    if(selectedIndex >= 0)
    {
        NSIndexPath *previousPath = [NSIndexPath indexPathForRow:selectedIndex inSection:0];
        selectedIndex = indexPath.row;
        [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:previousPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    selectedIndex = indexPath.row;
    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
    
    /*
    if(selectedIndex == indexPath.row)
    {
        selectedIndex = -1;
        [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        return;
    }
    
    if(selectedIndex >= 0)
    {
        NSIndexPath *previousPath = [NSIndexPath indexPathForRow:selectedIndex inSection:0];
        selectedIndex = indexPath.row;
        [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:previousPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    selectedIndex = indexPath.row;
    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
    */
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)segmentControlValueChanged:(id)sender {
    if (self.segmentControlAction.selectedSegmentIndex == 0) {
        //do something
        self.isGroupsEditable = YES;
        [mainTable setEditing:self.isGroupsEditable];
        [mainTable reloadData];
    }else if ( self.segmentControlAction.selectedSegmentIndex == 1){
         self.isGroupsEditable = NO;
        [mainTable setEditing:self.isGroupsEditable];
        [mainTable reloadData];
    }
}
@end
