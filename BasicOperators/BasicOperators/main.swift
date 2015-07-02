//
//  main.swift
//  BasicOperators
//
//  Created by JayWon on 14/6/8.
//  Copyright (c) 2014年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

import Foundation

//1、基本运算符
/*
1、Swift支持C标准库中的大多数运算符并提升了各自的兼容性，从而可以排除常见的编码错误
2、分配符 (=)不会返回一个值，这样可以防止你因粗心将 等于(==)写成 赋值运算符(=) 而引起的错误
3、算术符(+、 -、 *、 /、 % 等)会检查与驳回值溢出，这样可以避免值类型的数据在超过值类型所允许的存储范围时，出现意想不到的数据。你可以选择使用Swift所提供的值溢出运算符进行量化溢出的行为，详细见溢出操作符。
4、与C语言不同，Swift允许你对浮点数执行取余运算
5、Swift提供两个范围的运算符 (a..b 和  a...b)，作为表示一个数值范围的简写方式，这点C不支持
*/

/*
术语
操作符都是一元、二元或三元:
· 一元操作符操作单个对象 (如 -a)。一元前缀操作符出现在对象前(如 !b)，一元后缀操作符在对象后出现 (如 i++)。
· 二元操作符操作两个对象(如 2 + 3)，并且操作符位于两个元素中间。
· 三元操作符对两个对象进行操作。与C一样，Swift仅支持一个三元操作符：三元条件操作符 (a ? b : c)。(?前面一定需要至少一个空格)
操作符所影响的值被称为操作数。表达式1 + 2中，符号 + 是一个二元运算符并且两个操作数分别为 1 和 2。
*/


/*


//2、赋值运算符
let b = 10
var a = 5
a = b               //用b的值去初始化或更新a 的值

let (x, y) = (1, 2) // x等于1, 并且y等于2

//与C及Objective-C不同，Swift中赋值运算符并不将自身作为一个值进行返回。所以以下的代码是不合法的：
//此特性帮助你避免因粗心将 等于(==)写成 赋值运算符 (=) 而引起的错误。因为 if a = b 这样写是无效的
/*
if a = b {
    // 错误, 因为a = b并不会返回一个值
}
*/




//3、数学运算符
/*
Swift支持所有数字类型的四个标注运算符:
· 加法(+)

· 减法(-)

· 乘法(*)

· 除法(/)
*/

1 + 2 // equals 3
5 - 3 // equals 2
2 * 3 // equals 6
10.0 / 2.5 // equals 4.0
//不同于C和Objective-C，默认情况下Swift的算术运算符不允许值溢出。
//你可以通过Swift的溢出运算符来选择值的溢出情况(例如 a & + b)。详见 Overflow Operators


//两个字符，或者一个字符一个字符串，能组合成一个新的字符串：
let dog: Character = "🐶"
let cow: Character = "🐮"
//let dogCow = dog + cow  // dogCow is equal to "🐶🐮"
var dogCow: String = ""
dogCow.append(dog)
dogCow.append(cow)
print(dogCow)

//余数运算符
//余数运算符(a % b)a是b的几倍并且返回被留下的值(叫作余数)
9 % 4 // equals 1

//浮点余数计算
//不同于C和Objective-C，Swift的余数运算符也能运用于浮点数：

8 % 2.5 // equals 0.5

*/


/*
//增量和减量运算符（自增和自减运算符++\--）
/*
    如果运算符在变量之前被写，它在返回其值之前增加变量。
    如果运算符在变量之后被写，它在返回其值之后增加变量。
*/
var a = 0
let b = ++a // a and b are now both equal to 1
let c = a++ // a is now equal to 2, but c has been set to the pre-increment value of 1
*/

//4、复合赋值操作符
var a = 1
a += 2      //要注意的是，复合赋值操作符不返回值。例如，你不能写让成"let b = a += 2"


//一元减运算符（一个数值前加了符号-，叫作一元减运算符）
let three = 3
let minusThree = -three     // minusThree equals -3
let plusThree = -minusThree // plusThree equals 3, or "minus minus three"


//一元加运算符（一元加运算符(+)返回的值，不做任何变动）
let minusSix = -6
let alsoMinusSix = +minusSix // alsoMinusSix equals -6




//5、比较运算符. 通常用在条件语句
/*
Swift支持所有标准c的比较运算符
等于 (a == b)
不等于(a != b)
大于 (a > b)
小于 (a < b)
大于等于 (a >= b)
小于等于(a <= b)
Swift 提供两个恒等运算符(=== and !==)，用它来测试两个对象引用是否来自于同一个对象实例
*/
1 == 1 // true, because 1 is equal to 1
2 != 1 // true, because 2 is not equal to 1
2 > 1 // true, because 2 is greater than 1
1 < 2 // true, because 1 is less than 2
1 >= 1 // true, because 1 is greater than or equal to 1
2 <= 1 // false, because 2 is not less than or equal to 1



//6、三元条件运算符
//三元条件运算符是一种特殊的运算符 有三个部分，其形式为question? answer1：answer2
//特别注意：因为Swift语言(?)有特殊的意义（可选量），所以三目运算符里面的(?)前面一定要有至少一个空格，否则就当成了可选量

//三元条件运算符是下面的代码的简化
/*
if question {
    answer1
} else {
    answer2
}
*/
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)




//7、范围运算符
//Swift包含两个范围运算符，能快捷的表达一系列的值

//7.1封闭范围运算符
//封闭范围运算符(a...b)定义了一个范围,从a到b,并包括a和b的值
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

//7.2半封闭的区域运算符（包头不包尾）
//半封闭的区域运算符(a..b)定义了从a到b的范围，但不包括b。它被认为是半封闭的，因为它包含第一个值，而不包含最终值。
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i) is called \(names[i])")
}
// Person 0 is called Anna
// Person 1 is called Alex
// Person 2 is called Brian
// Person 3 is called Jack



//8、逻辑运算符
/*
逻辑运算符修改或结合布尔逻辑值true和false。Swift支持这三个标准逻辑运算符基于c语言:
Logical NOT (!a)        //逻辑非
Logical AND (a && b)    //逻辑与
Logical OR (a || b)     //逻辑或
*/

//8.1逻辑非运算符
//逻辑非运算符(!a)转化一个Bollean值，以便true成为false，false变成true
let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}

//8.2逻辑与运算符
//创建逻辑与运算符：（A && B），其中A和B两个值必须同时为true时表达式才正确。
let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

//8.3逻辑或运算符
//表达式（a || b）运算符中、只要a或者b有一个为true、则表达式正确。
let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

//8.4复合逻辑表达式
//你可以将多个逻辑运算符复合来创建更长的复合表达式
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// prints "Welcome!"

//可以添加(), 明确意图
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// prints "Welcome!"

