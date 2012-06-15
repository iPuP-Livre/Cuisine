//
//  CuisineTests.m
//  CuisineTests
//
//  Created by Jérémy Lagrue on 09/04/12.
//  Copyright (c) 2012 iPuP SARL. All rights reserved.
//

#import "CuisineTests.h"
#import "Ingredient.h"
#import "Achat.h"
#import "Rangement.h"

@implementation CuisineTests

- (void)setUp
{
    [super setUp];
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    [super tearDown];
}

- (void)testExample
{
    //si le premier paramètre est vrai alors le test est un succès
    STAssertTrue(true, @"J'ai implémenté mes tests correctement");
}

-(void)testCreationIngredients
{
    Ingredient *tomate = [[Ingredient alloc] initWithNom:@"Tomate" conservation:ConservationRefrigerateur];
    STAssertEqualObjects([tomate nom], @"Tomate", @"Le nom de l'ingredient n'est pas écrit correctement");
    STAssertEquals ([tomate conservation], ConservationRefrigerateur, @"Le mode de conservation de l'ingredient n'est pas écrit correctement");
    
    Ingredient *petitBeurre = [[Ingredient alloc] initWithNom:@"Petit Beurre" conservation:ConservationPlacard];
    STAssertEqualObjects([petitBeurre nom], @"Petit Beurre", @"Le nom de l'ingredient n'est pas écrit correctement");
    STAssertEquals ([petitBeurre conservation], ConservationPlacard, @"Le mode de conservation de l'ingrédient n'est pas écrit correctement");
}

-(void)testCreationAchat
{    
    // -----------------------------------
    //  Produit pour le réfrigerateur
    // -----------------------------------
    Ingredient *tomate = [[Ingredient alloc] initWithNom:@"Tomate" conservation:ConservationRefrigerateur];
    Achat *achatTomate = [[Achat alloc] initWithIngredient:tomate];
      
    // Une  date d'achat doit être dans le passé.
    // On teste la présence d'une exception si ce n'est pas le cas
    STAssertThrows(achatTomate.dateAchat = [NSDate dateWithTimeIntervalSinceNow:30], @"Achat accepte une date d'achat dans le futur");
    
    achatTomate.dateAchat = [NSDate dateWithTimeIntervalSinceNow:-1];
    achatTomate.dureeConservation = 7;
    achatTomate.quantite = 6;
    
    // -----------------------------------
    //  Produit pour le placard
    // -----------------------------------
    Ingredient *petitBeurre = [[Ingredient alloc] initWithNom:@"Petit Beure" conservation:ConservationPlacard];
    Achat *achatPetitBeurre = [[Achat alloc] initWithIngredient:petitBeurre];
    achatPetitBeurre.dateAchat = [NSDate dateWithTimeIntervalSinceNow:-1];
    
    // Une  date limite doit être dans le futur.
    // On teste la présence d'une exception si ce n'est pas le cas
    STAssertThrows(achatPetitBeurre.dateLimite = [NSDate dateWithTimeIntervalSinceNow:-30], @"Achat accepte une date limite dans le passé");
    
    achatPetitBeurre.dateLimite = [NSDate dateWithTimeIntervalSinceNow:+1];
    achatPetitBeurre.quantite = 1;
}


-(void)testCreationRangement
{
    Rangement *rangement = [[Rangement alloc] init];
    
    // -----------------------------------
    //  La tomate dans le réfrigerateur
    //  (et pas dans la placard)
    // -----------------------------------
    Ingredient *tomate = [[Ingredient alloc] initWithNom:@"Tomate" conservation:ConservationRefrigerateur];
    Achat *achatTomate = [[Achat alloc] initWithIngredient:tomate];
    achatTomate.dateAchat = [NSDate dateWithTimeIntervalSinceNow:-1];
    achatTomate.dureeConservation = 7;
    achatTomate.quantite = 6;
    
    STAssertTrueNoThrow([rangement ajoutRefrigerateur:achatTomate], @"Impossible de mettre une tomate dans la réfrigerateur");
    STAssertFalseNoThrow([rangement ajoutPlacard:achatTomate], @"j'ai mis une tomate dans la placard");
    STAssertEquals((NSInteger)[[rangement contenuRefrigerateur] count], 1, @"La tomate n'est pas dans le réfrigerateur");
    STAssertEquals((NSInteger)[[rangement contenuPlacard] count], 0, @"La tomate est dans le réfrigerateur"); 
    
    Rangement *rangement2 = [[Rangement alloc] init];
    
    // -----------------------------------
    //  Le petit beurre dans la placard
    //  (et pas dans le réfrigerateur)
    // -----------------------------------
    Ingredient *petitBeurre = [[Ingredient alloc] initWithNom:@"Petit Beure" conservation:ConservationPlacard];
    Achat *achatPetitBeurre = [[Achat alloc] initWithIngredient:petitBeurre];
    achatPetitBeurre.dateAchat = [NSDate dateWithTimeIntervalSinceNow:-1];
    achatPetitBeurre.dateLimite = [NSDate dateWithTimeIntervalSinceNow:+1];
    achatPetitBeurre.quantite = 1;
    
    STAssertTrueNoThrow([rangement2 ajoutPlacard:achatPetitBeurre], @"Impossible de mettre le petit beurre dans la placard");
    STAssertFalseNoThrow([rangement2 ajoutRefrigerateur:achatPetitBeurre], @"j'ai un petit beurre dans le placard");
    STAssertEquals((NSInteger)[[rangement2 contenuPlacard] count], 1, @"Le petit beurre n'est pas dans le placard");
    STAssertEquals((NSInteger)[[rangement2 contenuRefrigerateur] count], 0, @"Le petit beurre est dans le réfrigerateur"); 
}

@end
 