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
    MagicalCreature *horseOne = [[MagicalCreature alloc] initWithName:@"Arion" withDetail:@"swift steed of Demeter by Poseidon" withOrigin:@"Greece" withImage:[UIImage imageNamed:@"arion.jpg"]];
    MagicalCreature *horseTwo = [[MagicalCreature alloc] initWithName:@"Al-Burāq" withDetail:@"heavenly transporter of the prophets" withOrigin:@"Mecca" withImage:[UIImage imageNamed:@"al-buraq.jpg"]];
    MagicalCreature *horseThree = [[MagicalCreature alloc] initWithName:@"Longma" withDetail:@"dragon horse" withOrigin:@"China" withImage:[UIImage imageNamed:@"longma.jpg"]];
    MagicalCreature *horseFour = [[MagicalCreature alloc] initWithName:@"Cheval Gauvain" withDetail:@"harbinger of death" withOrigin:@"France" withImage:[UIImage imageNamed:@"cheval-gauvain.jpg"]];
    MagicalCreature *horseFive = [[MagicalCreature alloc] initWithName:@"Pegasus" withDetail:@"divine winged defeater of the chimera" withOrigin:@"Greece" withImage:[UIImage imageNamed:@"pegasus.jpg"]];
    MagicalCreature *horseSix = [[MagicalCreature alloc] initWithName:@"Sleipnir" withDetail:@"Odin's eight-legged horse, the best among gods and men" withOrigin:@"Norway" withImage:[UIImage imageNamed:@"sleipnir.jpg"]];
    MagicalCreature *horseSeven = [[MagicalCreature alloc] initWithName:@"Uchchaihshravas" withDetail:@"seven-headed winged king of horses" withOrigin:@"India" withImage:[UIImage imageNamed:@"uchchaihshravas.jpg"]];

    self.creatures = [NSMutableArray arrayWithObjects:horseTwo, horseOne, horseFour, horseThree, horseFive, horseSix, horseSeven, nil];
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
    MagicalCreature *creature = [[MagicalCreature alloc] init];
    creature.creatureName = self.textField.text;
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
    cell.imageView.image = creature.creatureImage;

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
