//
//  Achat.h
//  Cuisine
//
//  Created by Jérémy Lagrue on 09/04/12.
//  Copyright (c) 2012 iPuP SARL. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Ingredient;

@interface Achat : NSObject

@property (strong, nonatomic) Ingredient *ingredient;
@property (strong, nonatomic) NSDate *dateAchat;
@property (strong, nonatomic) NSDate *dateLimite;
@property NSInteger dureeConservation;
@property NSInteger quantite;

-(id)initWithIngredient:(Ingredient*)ingredient;

@end
