#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    NSMutableString *result = [[NSMutableString alloc] init];
    if (numbersArray == nil || numbersArray.count == 0) {
        return @"";
    }
    
    for (NSInteger i = 0; i < 4; i++) {
        NSInteger threes = 0;
        if (i < numbersArray.count) {
            threes = [numbersArray[i] intValue];
        }
        if (threes > 255) {
            return @"The numbers in the input array can be in the range from 0 to 255.";
        } else if (threes < 0) {
            return @"Negative numbers are not valid for input.";
        } else {
            [result appendFormat:@"%ld.", threes];
        }
    }
        
    return [result substringToIndex:[result length] - 1];
    }


@end
