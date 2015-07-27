//
//  CreatureViewController.m
//  MCMS
//
//  Created by Rachel Schneebaum on 7/21/15.
//  Copyright (c) 2015 Rachel Schneebaum. All rights reserved.
//

#import "CreatureViewController.h"
#import "MagicalCreature.h"

@interface CreatureViewController ()

@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.editButton.hidden = false;
    self.editButton.enabled = true;
    self.doneButton.hidden = true;
    self.doneButton.enabled = false;
    self.nameTextField.hidden = true;
    self.nameTextField.enabled = false;
    self.nameLabel.hidden = false;
    self.detailTextView.editable = false;

    self.nameLabel.text = self.creature.creatureName;
    self.detailTextView.text = self.creature.creatureDetail;
    self.originLabel.text = self.creature.creatureOrigin;
    self.imageView.image = self.creature.creatureImage;
}

- (IBAction)onEditButtonTapped:(UIButton *)sender {
    [self switchEditDoneButtonsOnButtonTap];
    [self.nameTextField endEditing:true];
}

- (IBAction)onDoneButtonTapped:(UIButton *)sender {
    [self switchEditDoneButtonsOnButtonTap];
    self.nameLabel.text = self.nameTextField.text;
    self.nameLabel.hidden = false;
    self.nameTextField.hidden = true;
    self.creature.creatureName = self.nameLabel.text;
}

-(void)switchEditDoneButtonsOnButtonTap {
    self.editButton.hidden = !self.editButton.hidden;
    self.editButton.enabled = !self.editButton.enabled;
    self.doneButton.hidden = !self.doneButton.hidden;
    self.doneButton.enabled = !self.doneButton.enabled;
    self.nameTextField.hidden = !self.nameTextField.hidden;
    self.nameTextField.enabled = !self.nameTextField.enabled;
    self.nameLabel.hidden = !self.nameLabel.hidden;
}


@end
