#import <Foundation/Foundation.h>
#import "PBWISzafa.h"

@implementation PBWISzafa :PBWIZasob

@synthesize pojemnosc = _pojemnosc;

-(id) initZPojemnoscia: (int)poj iKolorem: (NSString*)kol{
    self = [super init];
    if (self) {
        _pojemnosc = poj;
        self.kolor = kol;
    }
    return self;
}
-(NSString *) opisZasobu {
    return [NSString stringWithFormat:@"Szafa o kolorze: %@", self.kolor];
}

@end
