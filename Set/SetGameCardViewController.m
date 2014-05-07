//
//  SetGameCardViewController.m
//  Set
//
//  Created by Victor, Jason M on 5/5/14.
//  Copyright (c) 2014 Victor, Jason M. All rights reserved.
//

#import "SetGameCardViewController.h"
#import "SetCardDeck.h"
#import "GameCardViewController.h"
#import "CardMatchingGame.h"

@interface SetGameCardViewController ()
@property (strong, nonatomic) CardMatchingGame *game;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UINavigationItem *navBar;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation SetGameCardViewController


- (Deck *) createDeck {
    
    return [[SetCardDeck alloc] init];
}


- (CardMatchingGame *) game {
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count
                                                          usingDeck:[self createDeck] ];
    [_game setGameMode:3]; //SET is always 3 cards
    return _game;
}

-(void) updateUI {
    for (UIButton *cardButton in self.cardButtons) {
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setAttributedTitle:card.attributedContents forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[UIImage imageNamed:@"cardfront"] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.navBar.title = [NSString stringWithFormat:@"Score: %d", self.game.score];
    }
    
    self.resultLabel.attributedText = self.game.gameLog;
    NSLog(@"gameMode now equals: %d", self.game.gameMode);
#warning matching needs to be tested.  It seems to be trying to match on two instead of 3.
#warning create visual way to find picked cards
    
}


- (IBAction)touchCardButton:(UIButton *)sender {
    
    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    //self.resultLabel.text = [self.game chooseCardAtIndex:(int)chosenButtonIndex];
    [self.game chooseCardAtIndex:(int)chosenButtonIndex];
    [self updateUI];
}


- (void) redeal {
    [self.game resetGame];
    self.resultLabel.attributedText = nil;
    [self updateUI];
    self.game = nil;
    [self.game setGameMode:3];
}



#pragma mark default methods
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self updateUI];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
