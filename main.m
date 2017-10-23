#import <objc/objc.h>
#import <objc/Object.h>
#import <Foundation/Foundation.h>
#import "PBWIZasob.h"
#import "PBWIBiurko.h"
#import "PBWIKrzeslo.h"
#import "PBWIPokoj.h"
#import "PBWIZasobyWydzialu.h"
#import "PBWISzafa.h"


int main()
{
    @autoreleasepool {
        PBWIZasob * zasob = [[PBWIZasob alloc] init];
        [zasob setKolor: @"szary"];
        NSLog(@"Przykladowy zasob: %@", [zasob opisZasobu]);
        PBWIBiurko * biurko = [[PBWIBiurko alloc] initWithParams:100 :80 :140];
        [biurko setKolor: @"brazowy"];
        NSLog(@"Przykladowe biurko: %@", [biurko opisZasobu]);
        PBWIKrzeslo * krzeslo = [[PBWIKrzeslo alloc] init];
        [krzeslo setObicie: @"skora"];
        [krzeslo setKolor: @"czarny"];
        NSLog(@"Przykladowe krzeslo: %@", [krzeslo opisZasobu]);
        
        PBWIPokoj *pokoj= [[PBWIPokoj alloc] init];
        [pokoj dodajZasob: biurko];
        [pokoj dodajZasob: krzeslo];
        [pokoj usunZasob: biurko];
        
        PBWIZasobyWydzialu *wi = [[PBWIZasobyWydzialu alloc] init];
        
        PBWIPokoj *pokoj209 = [[PBWIPokoj alloc] init];
        PBWISzafa *szafka = [[PBWISzafa alloc] initZPojemnoscia:50 iKolorem:@"Bialy"];
        
        [wi dodajPokoj:pokoj209];
        [wi dodajPokoj: pokoj];
        
        [wi dodajZasob:szafka doPokoju:pokoj209];
        NSLog(@"Szafa %@", [szafka opisZasobu] );
        
        NSArray *biurka = [wi wypiszBiurka];
        for (id el in biurka){
            NSLog(@"%@",[el opisZasobu]);
        }
        
        NSArray *numery = [wi wypiszNr];
        for (id el in numery){
            NSLog(@"Pokoj nr %@",el);
        }
        
        PBWIKrzeslo * krzeslo2 = [[PBWIKrzeslo alloc] init];
        [krzeslo2 setObicie: @"Puch"];
        [krzeslo2 setKolor: @"Czarny"];
        [wi dodajZasob:krzeslo2 doPokoju:pokoj];
        NSArray *krzesla = [wi wypiszKrzesla];
        for (id el in krzesla){
            NSLog(@"%@",[el opisZasobu]);
        }
        
        NSArray *rzeczyZpokoju = [pokoj209 wszystkieZasoby];
        NSLog(@"Zasob w pokoju 209 przed usunieciem: %lu", (unsigned long)[rzeczyZpokoju count]);
        [wi usunZasob:szafka zPokoju:pokoj209];
        rzeczyZpokoju = [pokoj209 wszystkieZasoby];
        NSLog(@"Zasob w pokoju 209 po usunieciu: %lu", (unsigned long)[rzeczyZpokoju count]);
        
        [wi dodajZasob:szafka doPokoju:pokoj209];
        NSLog(@"Szafa %@", [szafka opisZasobu] );
        
        rzeczyZpokoju = [pokoj209 wszystkieZasoby];
        NSLog(@"Meble w 209: %lu", (unsigned long)[rzeczyZpokoju count]);
        NSArray *rzeczyZpokoju1 = [pokoj wszystkieZasoby];
        NSLog(@"Ilosc mebli w pokoju przed przeniesieniem: %lu", (unsigned long)[rzeczyZpokoju1 count]);
        [wi przeniesZasob:szafka zPokoju:pokoj209 doPokoju:pokoj];
        rzeczyZpokoju = [pokoj209 wszystkieZasoby];         NSLog(@"Ilosc mebli w pokoju 209 po przeniesieniu: %lu", (unsigned long)[rzeczyZpokoju count]);
        rzeczyZpokoju1 = [pokoj wszystkieZasoby];        NSLog(@"Ilosc mebli w pokoju po przeniesieniu: %lu", (unsigned long)[rzeczyZpokoju1 count]);
    }
    return 0;
}




