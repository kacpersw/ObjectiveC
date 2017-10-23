#import "PBWIZasob.h"
#import "PBWISzafa.h"

@interface PBWISzafa : PBWIZasob {
@private int _pojemnosc;
}

@property(readonly) int pojemnosc;

-(id) initZPojemnoscia :(int)poj iKolorem:(NSString *)kol;
-(NSString *) opisZasobu;

@end
