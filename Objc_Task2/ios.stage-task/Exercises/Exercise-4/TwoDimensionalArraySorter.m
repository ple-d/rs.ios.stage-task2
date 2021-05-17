#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
     if (array == nil || ![array[0] isKindOfClass:NSArray.class]){
           return @[];
       }

    NSMutableArray<NSNumber*> *numberArray = [[NSMutableArray alloc] init];
    NSMutableArray<NSString*> *stringArray = [[NSMutableArray alloc] init];

    
    for (NSArray *internalArray in array) {
        for (id element in internalArray) {
            if ([element isKindOfClass:NSNumber.class]) {
                [numberArray addObject:element];
            } else {
                [stringArray addObject:element];
            }
        }
    }
    
    
    if (stringArray.count == 0) {
        [numberArray sortUsingDescriptors:
         [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES]]];
        return numberArray;
    } else if (numberArray.count == 0) {
        [stringArray sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
        return stringArray;
    }
    

    [numberArray sortUsingDescriptors:
     [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES]]];
    
    [stringArray sortUsingDescriptors:
     [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"self" ascending:NO selector:@selector(localizedCaseInsensitiveCompare:)]]];
    
    
    return [NSArray arrayWithObjects:numberArray, stringArray, nil];
}

@end
