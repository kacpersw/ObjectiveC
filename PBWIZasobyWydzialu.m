#import <Foundation/Foundation.h>
#import "PBWIZasobyWydzialu.h"
#import <stdlib.h>

@implementation PBWIZasobyWydzialu

-(id) init {
    if (self = [super init]) {
        pokoje = [[NSMutableDictionary alloc] init];
        zasoby = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void) dodajZasob:(PBWIZasob *) zasob doPokoju:(PBWIPokoj *)pokoj {
    [zasoby addObject:zasob];
    for (PBWIPokoj *p in [pokoje allValues]) {
        if ([p isEqual:pokoj]) {
            [p dodajZasob:zasob];
        }
    }
}

-(void) usunZasob:(PBWIZasob *)zasob zPokoju:(PBWIPokoj *)pokoj {
    for (PBWIPokoj *p in [pokoje allValues]) {
        if ([p isEqual:pokoj]) {
            [p usunZasob:zasob];
        }
    }
}
-(void)przeniesZasob:(PBWIZasob *)zasob zPokoju:(PBWIPokoj *)zpokoju doPokoju:(PBWIPokoj *)dopokoju {
    [zpokoju usunZasob:zasob];
    [dopokoju dodajZasob:zasob];
}



-(void) dodajPokoj:(PBWIPokoj *)pokoj {
    NSInteger licznik = arc4random_uniform(300);
    NSString *index = [@(licznik) stringValue];
    pokoje[index] = pokoj;
}

-(NSArray *)wypiszNr {
    NSArray *keys = [pokoje allKeys];
    return keys;
}

-(NSArray *)wypiszBiurka {
    NSMutableArray *biurka = [[NSMutableArray alloc] init];
    for(PBWIZasob *zasob in zasoby) {
        if ([[zasob className] isEqualToString:@"PBWIBiurko"]) {
            [biurka addObject:zasob];
        }
    }
    return biurka;
}

-(NSArray *)wypiszKrzesla {
    NSMutableArray *krzesla = [[NSMutableArray alloc] init];
    for(PBWIZasob *zasob in zasoby) {
        if ([[zasob className] isEqualToString:@"PBWIKrzeslo"]) {
            [krzesla addObject:zasob];
        }
    }
    return krzesla;
}

@end
