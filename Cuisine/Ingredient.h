//
//  Ingredient.h
//  Cuisine
//
//  Created by Jérémy Lagrue on 09/04/12.
//  Copyright (c) 2012 iPuP SARL. All rights reserved.
//

#import <Foundation/Foundation.h>

// utisation d'un énuméré pour le type de conservation
typedef enum {
    ConservationRefrigerateur = 0,
    ConservationPlacard
} Conservation;

@interface Ingredient : NSObject

@property(strong, nonatomic) NSString *nom;
@property Conservation conservation;

-(id)initWithNom:(NSString*)nom conservation:(Conservation)conservation;

@end
