//
//  Rangement.m
//  Cuisine
//
//  Created by Jérémy Lagrue on 09/04/12.
//  Copyright (c) 2012 iPuP SARL. All rights reserved.
//

#import "Rangement.h"
#import "Achat.h"
#import "Ingredient.h"

@implementation Rangement

-(id)init
{
    self = [super init];
    if(self)
    {
        _refrigerateur = [[NSMutableArray alloc] init];
        _placard = [[NSMutableArray alloc] init];
    }
    return self;
}

-(BOOL)ajoutRefrigerateur:(Achat*)achat
{
    if(achat.ingredient.conservation == ConservationRefrigerateur)
    {
        [_refrigerateur addObject:achat];
        return YES;
    }
    return NO;
}

-(BOOL)ajoutPlacard:(Achat*)achat
{
    if(achat.ingredient.conservation == ConservationPlacard)
    {  
        [_placard addObject:achat];
        return YES;
    }
    return NO;
}

-(NSArray*)contenuRefrigerateur
{
    NSLog(@"%@", _refrigerateur);
    return [NSArray arrayWithArray:(NSArray *)_refrigerateur];
}

-(NSArray*)contenuPlacard
{
    return [NSArray arrayWithArray:(NSArray *)_placard];
}

@end
