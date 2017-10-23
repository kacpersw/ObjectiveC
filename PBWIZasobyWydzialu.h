#import "PBWIZasobyWydzialu.h"
#import <objc/objc.h>
#import <objc/Object.h>
#import <Foundation/Foundation.h>
#import "PBWIPokoj.h"

@interface PBWIZasobyWydzialu : NSObject {
@private NSString * _kolor;
    
@private NSMutableDictionary *pokoje;
@private NSMutableArray *zasoby;
}

@property(copy) NSString * kolor;
-(NSString *) opisZasobu;

-(id)init;
-(void) dodajZasob:(PBWIZasob *)zasob doPokoju:(PBWIPokoj *) pokoj;
-(void) usunZasob:(PBWIZasob *)zasob zPokoju:(PBWIPokoj *) pokoj;
-(void) przeniesZasob:(PBWIZasob *)zasob zPokoju:(PBWIPokoj *)zpokoju doPokoju:(PBWIPokoj *)dopokoju;

-(NSArray *)wypiszKrzesla;
-(NSArray *)wypiszBiurka;
-(NSArray *)wypiszNr;
-(void) dodajPokoj:(PBWIPokoj *)pokoj;

@end
