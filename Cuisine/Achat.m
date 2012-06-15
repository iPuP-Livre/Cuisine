//
//  Achat.m
//  Cuisine
//
//  Created by Jérémy Lagrue on 09/04/12.
//  Copyright (c) 2012 iPuP SARL. All rights reserved.
//

#import "Achat.h"
#import "Ingredient.h"

@implementation Achat

@synthesize ingredient = _ingredient;
@synthesize dateAchat = _dateAchat;
@synthesize dateLimite = _dateLimite;
@synthesize dureeConservation = _dureeConservation;
@synthesize quantite = _quantite;

-(id)initWithIngredient:(Ingredient*)ingredient
{
    self = [super init];
    if(self)
    {
        _ingredient = ingredient;
    }
    return self;
}

-(void)setDateAchat:(NSDate *)dateAchat
{
    NSDate *now = [NSDate date];
    if ([[dateAchat earlierDate:now] isEqualToDate:now])
    {
        //Création d'une exception
        NSException* exception = [NSException
                                    exceptionWithName:@"Date achat incompatible"
                                    reason:@"La date d'achat ne peut pas être dans le futur."
                                    userInfo:nil];
        @throw exception;
        return;
    }
    _dateAchat = dateAchat;
}

-(void)setDateLimite:(NSDate *)dateLimite
{
    NSDate *now = [NSDate date];
    if ([[dateLimite laterDate:now] isEqualToDate:now])
    {
        //Création d'une exception
        NSException* exception = [NSException
                                    exceptionWithName:@"Date limite incompatible"
                                    reason:@"La date limite ne peut pas dépassée"
                                    userInfo:nil];
        @throw exception;
        return;
    }
    _dateLimite = dateLimite;
}

@end
