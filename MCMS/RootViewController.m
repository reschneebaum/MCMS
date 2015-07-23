//
//  ViewController.m
//  MCMS
//
//  Created by Rachel Schneebaum on 7/21/15.
//  Copyright (c) 2015 Rachel Schneebaum. All rights reserved.
//

#import "RootViewController.h"
#import "CreatureViewController.h"
#import "MagicalCreature.h"

@interface RootViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *addButton;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //defaults
    self.addButton.enabled = false;
    MagicalCreature *arion = [[MagicalCreature alloc] initWithName:@"Arion" withDetail:@"swift steed of Demeter by Poseidon" withOrigin:@"Greek" withImage:nil];
    MagicalCreature *alBuraq = [[MagicalCreature alloc] initWithName:@"Al-Burāq" withDetail:@"heavenly transporter of the prophets" withOrigin:@"Mecca" withImage:nil];
    MagicalCreature *longma = [[MagicalCreature alloc] initWithName:@"Longma" detail:@"dragon horse" withOrigin:@"China" image:nil];
    MagicalCreature *phoenix = [[MagicalCreature alloc] initWithName:@"Phoenix" detail:@"regeneration" image:nil];

    self.creatures = [NSMutableArray arrayWithObjects:arion,/*sphinx,phoenix,*/ nil];
}

-(void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

-(void)viewDidAppear:(BOOL)Mag {
    [self.tableView reloadData];
}

//ensures addButton is enabled only when user has entered text
- (IBAction)onEditTextField:(UITextField *)sender {
    if (self.textField.hasText) {
        [self.addButton setEnabled:true];
    } else {
        [self.addButton setEnabled:false];
    }
}

//adds new creature of class MagicalCreature to mutable array
- (IBAction)onAddButtonPressed:(UIButton *)sender {
    MagicalCreature *creature = [[MagicalCreature alloc] initWithName:(NSString *)name withDetail:(NSString *)detail withOrigin:(NSString *)origin withImage:(UIImage *)image] {
    [self.creatures addObject:creature];

    [self.tableView reloadData];
    self.textField.text = @"";
    [self.textField endEditing:YES];
}

//adds unused cell from queue if available; creates new cell if not
//assigns dequeued/new cell to new instance MagicalCreature
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    MagicalCreature *creature = [self.creatures objectAtIndex:indexPath.row];
    cell.textLabel.text = creature.creatureName;
    cell.detailTextLabel.text = creature.creatureDetail;

    return cell;
}

//sets number of tableView rows equal to # objects in creatures array
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.creatures.count;
}

//sets destination of segue; passes information to destination
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    CreatureViewController *cvc = segue.destinationViewController;
    MagicalCreature *creature = [self.creatures objectAtIndex:[self.tableView indexPathForSelectedRow].row];
    cvc.creature = creature;
}


@end
