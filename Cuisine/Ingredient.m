//
//  Ingredient.m
//  Cuisine
//
//  Created by Jérémy Lagrue on 09/04/12.
//  Copyright (c) 2012 iPuP SARL. All rights reserved.
//

#import "Ingredient.h"

@implementation Ingredient

@synthesize nom = _nom;
@synthesize conservation = _conservation;

-(id)initWithNom:(NSString*)nom conservation:(Conservation)conservation
{
    self = [super init];
    if(self)
    {
        _nom = nom;
        _conservation = conservation;
    }
    return self;
}

@end
