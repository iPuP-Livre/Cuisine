//
//  Rangement.h
//  Cuisine
//
//  Created by Jérémy Lagrue on 09/04/12.
//  Copyright (c) 2012 iPuP SARL. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Achat;

@interface Rangement : NSObject
{
    NSMutableArray *_refrigerateur;
    NSMutableArray *_placard;
}

-(BOOL)ajoutRefrigerateur:(Achat*)achat;
-(BOOL)ajoutPlacard:(Achat*)achat;
-(NSArray*)contenuRefrigerateur;
-(NSArray*)contenuPlacard;

@end
