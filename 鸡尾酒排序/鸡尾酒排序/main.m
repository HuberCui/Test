//
//  main.m
//  鸡尾酒排序
//
//  Created by Xuebin Cui on 2018/3/30.
//  Copyright © 2018年 Xuebin Cui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>
#import <JavaScriptCore/JSValue.h>

void cocktail_sort(int list[],int list_length);
void swap(int list[],int i,int j);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
         int number[8] = {95,45,15,78,84,51,24,12};
        cocktail_sort(number, 8);
        for (int i = 0;i<8;i++) {
            printf("%d\n",number[i]);
        }
    
        JSContext *jsContext = [[JSContext alloc] init];
        [jsContext evaluateScript:@"var num = 500"];
        [jsContext evaluateScript:@"var computePrice = function(value){ return value * 2 }"];
         
         JSValue *value = [jsContext evaluateScript:@"computePrice(num)"];
         
         int  intVal = [value  toInt32];
        
         NSLog(@"计算结果为 %d", intVal);
    }
    
   
    return 0;
}


//鸡尾酒排序
//数组中的数字本是无规律的排放，先找到最小的数字，把他放到第一位，然后找到最大的数字放到最后一位。然后再找到第二小的数字放到第二位，再找到第二大的数字放到倒数第二位。以此类推，直到完成排序,相当于左右来回扫描，扫描范围向中心靠拢，越来越小
void cocktail_sort(int list[],int list_length){
    int bottom = 0;
    int top = list_length-1;
    bool swapped = true;
    int bound = 0;//优化循环次数，记录已经排序的边界，减少循环次数
    
    while (swapped) {
        swapped = false;
        for (int i = bottom; i<top; i++) {
            if (list[i] > list[i+1]) {
                swap(list, i,i+1);
                swapped = true;
                bound = i;
            }
        }
        
        top = bound;
        printf("=========%d",top);
        for (int i = top; i>bottom; i--) {
            
            if (list[i] < list[i-1]) {
                swap(list, i,i-1);
                swapped = true;
                bound = i;
            }
        }
        bottom = bound;
        
        
    }
}

void swap(int list[],int i,int j){
    int temp = list[i];
    list[i] = list[j];
    list[j] = temp;
}
