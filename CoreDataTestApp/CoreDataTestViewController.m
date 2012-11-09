//
//  CoreDataTestViewController.m
//  CoreDataTestApp
//
//  Created by Regie G. Pinat on 11/8/12.
//  Copyright (c) 2012 Regie G. Pinat. All rights reserved.
//

#import "CoreDataTestViewController.h"



@interface CoreDataTestViewController ()

@end

@implementation CoreDataTestViewController




- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addTime:)];
    self.navigationItem.rightBarButtonItem = addButton;
    [addButton release];
    
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(toggleEditingMode:)];
    self.navigationItem.leftBarButtonItem = editButton;
    [editButton release];
    
    [self fetchRecords];
    
    if (self.personalInfoArray.count > 0) {
        x = [[self.personalInfoArray objectAtIndex:0] orderID] +1;
        
    }
    
   else {
        x=0;
    }
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)toggleEditingMode:(id)sender{

    if ([self isEditing]) {
        [self setEditing:NO animated:YES];
    }
    else
    {
        [self setEditing:YES animated:YES];
    }

}


- (void)addTime:(id)sender {
    
    PersonalInfo *personalInfo = (PersonalInfo *)[NSEntityDescription insertNewObjectForEntityForName:@"PersonalInfo" inManagedObjectContext:self.managedObjectContext];
    
    
    
    [personalInfo setAge:14];
    [personalInfo setName:@"Name3"];
    [personalInfo setOrderID:x];
    //SAVE
    NSError *error;
    if(![self.managedObjectContext save:&error]){
        //This is a serious error saying the record
        //could not be saved. Advise the user to
        //try again or restart the application.
    }
    [self.personalInfoArray insertObject:personalInfo atIndex:0];
    x= x +1;
    [self.tableView reloadData];
}




- (void)fetchRecords {
    // Define our table/entity to use
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"PersonalInfo" inManagedObjectContext:_managedObjectContext];
    
    
    
    // Setup the fetch request
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
  //  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(name like %@) AND (age > %d)",@"Name3",10];
    
    //[request setPredicate:predicate];
    
    
    // Define how we will sort the records
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"orderID" ascending:NO];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    [request setSortDescriptors:sortDescriptors];
    [sortDescriptor release];
    
    
    
    // Fetch the records and handle an error
    NSError *error;
    NSMutableArray *mutableFetchResults = [[_managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    
    
    if (!mutableFetchResults) {
        // Handle the error.
        // This is a serious error and should advise the user to restart the application
    }
    // Save our fetched data to an array
    [self setPersonalInfoArray: mutableFetchResults];
    [mutableFetchResults release];
    [request release];
}





#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
   return [self.personalInfoArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...

    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
   PersonalInfo *personalInfo = [self.personalInfoArray objectAtIndex: [indexPath row]];
    
    cell.textLabel.text = [personalInfo name];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"ID:%.0f  Age:%d",[personalInfo orderID],[personalInfo age]];
   
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
    
     
            
            if (editingStyle == UITableViewCellEditingStyleDelete) {
                
    
            }
        
        
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}





- (void)dealloc {
    [self.managedObjectContext release];
    [self.personalInfoArray release];
    [super dealloc];
}





@end
