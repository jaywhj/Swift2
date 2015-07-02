//
//  main.swift
//  Functions
//
//  Created by JayWon on 14-6-14.
//  Copyright (c) 2014年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

import Foundation

//1、函数的定义与调用
//func 函数名(形参: 形参类型) -> 返回类型
//以 func 作为前缀，返回箭头 -> 表示函数的返回类型
func sayHello(personName: String) -> String {
    let greeting = "Hello, " + personName + "!"
    return greeting         //返回值
//    return "Hello again, " + personName + "!"
}
print(sayHello("Anna"))   //sayHello("Anna") 为函数调用


//1.1函数参数与返回值（Function Parameters and Return Values）
//多重输入参数（Multiple Input Parameters）
//函数可以有多个输入参数，写在圆括号中，用逗号分隔
func halfOpenRangeLength(start: Int, end: Int) -> Int {
    return end - start
}
print(halfOpenRangeLength(1, end: 10))


//1.2无参函数（Functions Without Parameters）
//函数可以没有参数，但不能缺少后面的圆括号（）
func sayHelloWorld() -> String {
    return "hello, world"
}
print(sayHelloWorld())
// prints "hello, world”


//1.3无返回值函数（Functions Without Return Values）
//函数可以没有返回值
func sayGoodbye(personName: String) {
    print("Goodbye, \(personName)!")
}
sayGoodbye("Dave")
// prints "Goodbye, Dave!”
/*
严格上来说，虽然没有定义返回值，sayGoodbye 函数依然返回了值。
没有定义返回类型的函数会返回特殊的值，叫 Void。它其实是一个空的元组（tuple），没有任何元素，可以写成()。
*/

//1.3.1被调用时，一个函数的返回值可以被忽略
func printAndCount(stringToPrint: String) -> Int {
    print(stringToPrint)
    return stringToPrint.characters.count //定义了有返回值的函数必须返回一个值
}
func printWithoutCounting(stringToPrint: String) {
    printAndCount(stringToPrint)        //printAndCount 函数的返回值可以被忽略
}
printAndCount("hello, world")
printWithoutCounting("hello, world")


//1.4多重返回值函数（Functions with Multiple Return Values）
//你可以用元组（tuple）类型让多个值作为一个复合值从函数中返回
func count(string: String) -> (vs: Int, cs: Int, os: Int) {
    var vowels = 0, consonants = 0, others = 0
    for character in string.characters {
        switch String(character).lowercaseString {
        case "a", "e", "i", "o", "u":
            ++vowels
        case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
        "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
            ++consonants
        default:
            ++others
        }
    }
    return (vowels, consonants, others) //返回元组
}
let total = count("some arbitrary string!")
print("\(total.vs) vowels and \(total.cs) consonants")
// prints "6 vowels and 13 consonants”





//2.函数参数名称（Function Parameter Names）
//以上所有的函数都给它们的参数定义了参数名（parameter name）：
//但是，这些参数名仅在函数体中使用，不能在函数调用时使用。这种类型的参数名被称作局部参数名（local parameter name），因为它们只能在函数体中使用。
func someFunction(parameterName: Int) {

}


//2.1外部参数名（External Parameter Names）
//有时候，调用函数时，给每个参数命名是非常有用的，因为这些参数名可以指出各个实参的用途是什么。
//如果你希望函数的使用者在调用函数时提供参数名字，那就需要给每个参数除了局部参数名外再定义一个外部参数名。

//语法:
//外部参数名写在局部参数名之前(externalParameterName)，用空格分隔。
func someFunction(externalParameterName localParameterName: Int) {
}
//如果提供了外部参数名，那么函数在被调用时，必须使用外部参数名



//Demo：把两个字符串联在一起，演示使用外部参数的好处
/*
//不使用外部参数
func join(s1: String, s2: String, joiner: String) -> String {
    return s1 + joiner + s2
}
join("hello", "world", ", ")    //当调用这个函数时，这三个字符串的用途是不清楚的
*/
/*
//为了让这些字符串的用途更为明显，我们为 join 函数添加外部参数名
func join(string s1: String, toString s2: String, withJoiner joiner: String) -> String {
    return s1 + joiner + s2
}
//使用外部参数名更有表现力，更为通顺，同时还保持了函数体是可读的和有明确意图的
join(string: "hello", toString: "world", withJoiner: ", ")
*/


//2.2简写外部参数名（Shorthand External Parameter Names）
//如果你需要提供外部参数名，但是局部参数名已经定义好了，那么你不需要写两次这些参数名。相反，只写一次参数名，并用井号（#）作为前缀就可以了。这告诉 Swift 使用这个参数名作为局部和外部参数名。
func containsCharacter(string string: String, characterToFind: Character) -> Bool {
    for character in string.characters {
        if character == characterToFind {
            return true
        }
    }
    return false
}
//这样定义参数名，使得函数体更为可读，清晰，同时也可以以一个不含糊的方式被调用
let containsAVee = containsCharacter(string: "aardvark", characterToFind: "v")


//2.3默认参数值（Default Parameter Values）
//你可以在函数体中为每个参数定义默认值。当默认值被定义后，调用这个函数时可以略去这个参数
func join(string s1: String, toString s2: String, withJoiner joiner: String = " ") -> String {
    return s1 + joiner + s2
}
let str1 = join(string: "hello", toString: "world", withJoiner: "-")   //指定第三个参数
print("str1:"+str1)   // returns "hello-world

let str2 = join(string: "hello", toString:"world")     //不指定第三个参数，第三个参数将使用默认值
print("str2:"+str2)   // returns "hello world”


//2.4默认值参数的外部参数名（External Names for Parameters with Default Values）
//为了使定义外部参数名更加简单，当你未给 带默认值的参数提供外部参数名时，Swift 会自动提供外部名字。此时外部参数名与局部名字是一样的，就像你已经在局部参数名前写了井号（#）一样
func join(s1: String, s2: String, joiner: String = " ") -> String {
    return s1 + joiner + s2
}
let str3 = join("hello", s2:"world", joiner: "-")
print("str3:" + str3)           // returns "hello-world”






//3.可变参数（Variadic Parameters）
//一个可变参数（variadic parameter）可以接受一个或多个值。函数调用时，你可以用可变参数来传入不确定数量的输入参数。通过在变量类型名后面加入（...）的方式来定义可变参数。

//传入可变参数的值在函数体内当做这个类型的一个数组。例如，一个叫做 numbers 的 Double... 型可变参数，在函数体内可以当做一个叫 numbers 的 Double[] 型的数组常量。
func arithmeticMean(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
print(arithmeticMean(1, 2, 3, 4, 5))
print(arithmeticMean(3, 8, 19))
//一个函数最多能有一个可变参数
//可变参数必须放在参数表中最后的位置





//4.常量参数和变量参数（Constant and Variable Parameters）
//函数参数默认是常量。但是有时候，如果函数中传入的参数可以修改的话将很有用。你可以通过指定一个或多个参数为变量参数，从而避免自己在函数中定义新的变量。变量参数不是常量，你可以在函数中把它当做新的可修改副本来使用。
//通过在参数名前加关键字 var 来定义变量参数
func alignRight(var string: String, countE: Int, pad: Character) -> String {
    let amountToPad = countE - string.characters.count
    for _ in 1...amountToPad {
        string.insert(pad, atIndex: string.startIndex)
//        string = pad + string
    }
    return string
}
let originalString = "hello"
let paddedString = alignRight(originalString, countE: 10, pad: "-")
print("originalString:" + originalString)
print("paddedString:" + paddedString)




//5.输入输出参数（In-Out Parameters）
//变量参数，正如上面所述，仅仅能在函数体内被更改。如果你想要一个函数可以修改参数的值，并且想要 这些修改在函数调用结束后仍然存在，那么就应该把这个参数定义为输入输出参数（In-Out Parameters）。

/*
定义一个输入输出参数时，在参数定义前加 inout 关键字
输入输出参数不能有默认值，而且可变参数不能用 inout 标记。如果你用 inout 标记一个参数，这个参数不能被 var 或者 let 标记。
*/
func swapTwoInts(inout a: Int, inout b: Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
//只能传入一个变量作为输入输出参数
var someInt = 3
var anotherInt = 107
//当传入的参数作为输入输出参数时，需要在参数前加&符，表示这个值可以被函数修改
swapTwoInts(&someInt, b: &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")






//Swift调用C函数
desc1()

//Swift调用OC
var funcClass = FuncBlock()     //拿到OC类
funcClass.desc2()






//6.函数类型（Function Types）（是一种数据类型，类似 C语言函数指针、OC语言的Block）
//分三步：1、定义函数；2、声明函数类型变量或常量；3、给函数类型变量赋值

//1、定义函数
func addTwoInts(a: Int, b: Int) -> Int {
    return a + b
}

func sum(a: Int, b: Int) -> Int {
    return a + b
}

func printHelloWorld() {
    print("hello, world")
}

/*
//2、声明一个叫做 mathFunction 的变量，类型是'一个有两个 Int 型的参数并返回一个 Int 型的值的函数'
var mathFunction: (Int, Int) -> Int

//3、给函数类型变量赋值
mathFunction = addTwoInts
*/

////既然是变量，有相同匹配类型的不同函数可以被赋值给同一个变量
//mathFunction = sum

//matchFunction = printHelloWorld //错误，函数类型不一样

//2、3步可以合并
//var mathFunction: (Int, Int) -> Int = addTwoInts    //可以理解成 var a: Int = 10
//类型推导，可以让 Swift 来推测 mathFunction 函数的类型
var mathFunction = addTwoInts

//4、使用
print("Result: \(mathFunction(2, b: 3))")





//6.1 函数类型作为参数类型（Function Types as Parameter Types）
//参数类型为 (Int, Int)
func printMathResult(mathFun: (Int, Int) -> Int, a: Int, b: Int) {
    print("Result: \(mathFun(a, b))")
}
printMathResult(addTwoInts, a: 3, b: 5)



/*
//6.2 函数类型作为返回类型（Function Type as Return Types）
//这两个函数的类型都是 (Int) -> Int
func stepForward(input: Int) -> Int {
    return input + 1
}
func stepBackward(input: Int) -> Int {
    print("input: \(input)")
    return input - 1
}

//好，有没有晕？😄晕了就休息一下，再看一遍刚刚讲过的内容；没晕就继续了
func chooseStepFunction(backwards: Bool)   ->    (Int) -> Int {
    return backwards ? stepBackward : stepForward   //返回函数类型
}

//好，还没晕？😄，你🐮
var currentValue = 3
//moveNearerTozero指向stepBackward
let moveNearerToZero = chooseStepFunction(currentValue > 0)
//let moveNearerTozero:(Int) -> Int = chooseStepFunction(true)  //原型
//moveNearerTozero = stepBackward
print(moveNearerToZero(10))   //9
*/




//7.嵌套函数（Nested Functions）
//这章中你所见到的所有函数都叫全局函数（global functions），它们定义在全局域中。你也可以把函数定义在别的函数体中，称作嵌套函数（nested functions）。

//默认情况下，嵌套函数是对外界不可见的，但是可以被他的封闭函数（enclosing function）来调用。一个封闭函数也可以返回它的某一个嵌套函数，使得这个函数可以在其他域中被使用
func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int {
        return input + 1
    }
    func stepBackward(input: Int) -> Int {
        return input - 1
    }
    return backwards ? stepBackward : stepForward
}
var currentValue = -4
let moveNearerToZero = chooseStepFunction(currentValue > 0)
print(moveNearerToZero(10))







//8.闭包（Closures）
/*
闭包表达式（Closure Expressions）
尾随闭包（Trailing Closures）
值捕获（Capturing Values）
闭包是引用类型（Closures Are Reference Types）
*/

//闭包是自包含的函数代码块，可以在代码中被传递和使用。 Swift 中的闭包与 C 和 Objective-C 中的代码块（blocks）以及其他一些编程语言中的 lambdas 函数比较相似。

//8.1 闭包表达式（Closure Expressions）
//闭包表达式语法一般形式如下：
/*
{ (parameters) -> returnType in
    statements
}
*/
//闭包表达式语法可以使用常量、变量和inout类型作为参数，不提供默认值。 也可以在参数列表的最后使用可变参数。 元组也可以作为参数和返回值。


//不使用闭包
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backwards(s1: String, s2: String) -> Bool {
    return s1 > s2
}
//Swift 标准库提供了sorted函数，会根据您提供的基于输出类型排序的闭包函数将已知类型数组中的值进行排序。
var reversed = names.sort(backwards)


//使用闭包
//闭包的函数体部分由关键字in引入。 该关键字表示闭包的参数和返回值类型定义已经完成，闭包函数体即将开始。
reversed = names.sort({ (s1: String, s2: String) -> Bool in
    return s1 > s2
})
//根据上下文推断类型（Inferring Type From Context）
reversed = names.sort({ s1, s2 in return s1 > s2 } )

//8.2 单表达式闭包隐式返回（Implicit Return From Single-Expression Clossures）
//单行表达式闭包可以通过隐藏return关键字来隐式返回单行表达式的结果，如上版本的例子可以改写为：
//在这个例子中，sort函数的第二个参数的函数类型明确了闭包必须返回一个Bool类型值。 因为闭包函数体只包含了一个单一表达式 (s1 > s2)，该表达式返回Bool类型值，因此这里没有歧义，return关键字可以省略。

reversed = names.sort({s1, s2 in s1.0 > s2.0 })

//8.3 参数名称缩写（Shorthand Argument Names）
//Swift 自动为内联函数提供了参数名称缩写功能，您可以直接通过$0,$1,$2来顺序调用闭包的参数。
//如果您在闭包表达式中使用参数名称缩写，您可以在闭包参数列表中省略对其的定义，并且对应参数名称缩写的类型会通过函数类型进行推断。 in关键字也同样可以被省略，因为此时闭包表达式完全由闭包函数体构成：
//$0和$1表示闭包中第一个和第二个String类型的参数。

reversed = names.sort({ $0.0 > $1.0 } )

//8.4 运算符函数（Operator Functions）
//Swift 的String类型定义了关于大于号 (>) 的字符串实现
reversed = names.sort(>)


print(reversed)   // reversed 为 ["Ewa", "Daniella", "Chris", "Barry", "Alex"]




//8.5 尾随闭包（Trailing Closures）
//如果您需要将一个很长的闭包表达式(以至于不能在一行中进行书写时)作为最后一个参数传递给函数，可以使用尾随闭包来增强函数的可读性。 尾随闭包是一个书写在函数括号之后的闭包表达式，函数支持将其作为最后一个参数调用。
//如果函数只需要闭包表达式一个参数，当您使用尾随闭包时，您甚至可以把()省略掉。
func someFunctionThatTakesAClosure(closure: () -> ()) {
    // 函数体部分
}
//不使用尾随闭包进行函数调用
someFunctionThatTakesAClosure({
    // 闭包主体部分
})
//使用尾随闭包进行函数调用
someFunctionThatTakesAClosure() {
    // 闭包主体部分
}

reversed = names.sort { $0.0 > $1.0 }


//将Int类型数组[16,58,510]转换为包含对应String类型的数组["OneSix", "FiveEight", "FiveOneZero"]:
let digitNames = [
0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

//number 为变量参数
let strings = numbers.map { (var number) -> String in
    var output = ""
    while number > 0 {
        //digitNames[]字典取值有可能出现取不到值的情况,所以返回一个可选值 (optional value)
        output = digitNames[number % 10]! + output
        number /= 10
    }
    return output
}
// strings 常量被推断为字符串类型数组，即 String[]
// 其值为 ["OneSix", "FiveEight", "FiveOneZero"]



//8.6 捕获值（Capturing Values）
//闭包可以在其定义的上下文中捕获常量或变量。 即使定义这些常量和变量的原域已经不存在，闭包仍然可以在闭包函数体内引用和修改这些值。
//Swift最简单的闭包形式是嵌套函数，也就是定义在其他函数的函数体内的函数。 嵌套函数可以捕获其外部函数所有的参数以及定义的常量和变量。
func makeIncrementor(forIncrement amount: Int)  ->    () -> Int {
    var runningTotal = 0
    
    //incrementor函数并没有获取任何参数，但是在函数体内访问了runningTotal和amount变量。这是因为其通过捕获在包含它的函数体内已经存在的runningTotal和amount变量而实现
    func incrementor() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementor
}
//定义了一个叫做incrementByTen的常量，该常量指向一个每次调用会加10的incrementor函数
let incrementByTen = makeIncrementor(forIncrement: 10)

//由于没有修改amount变量，incrementor实际上捕获并存储了该变量的一个副本，而该副本随着incrementor一同被存储。
//然而，因为每次调用该函数的时候都会修改runningTotal的值，incrementor捕获了当前runningTotal变量的引用，而不是仅仅复制该变量的初始值。捕获一个引用保证了当makeIncrementor结束时候并不会消失，也保证了当下一次执行incrementor函数时，runningTotal可以继续增加。
print(incrementByTen())
print(incrementByTen())
print(incrementByTen())
//Swift 会决定捕获引用还是拷贝值。 您不需要标注amount或者runningTotal来声明在嵌入的incrementor函数中的使用方式。 Swift 同时也处理runingTotal变量的内存管理操作，如果不再被incrementor函数使用，则会被清除。


let incrementBySeven = makeIncrementor(forIncrement: 7)
print(incrementBySeven())
print(incrementByTen())


//8.7 闭包是引用类型（Closures Are Reference Types）
//上面的例子中，incrementBySeven和incrementByTen是常量，但是这些常量指向的闭包仍然可以增加其捕获的变量值。 这是因为函数和闭包都是引用类型。

//无论您将函数/闭包赋值给一个常量还是变量，您实际上都是将常量/变量的值设置为对应函数/闭包的引用。 上面的例子中，incrementByTen指向闭包的引用是一个常量，而并非闭包内容本身。

//这也意味着如果您将闭包赋值给了两个不同的常量/变量，两个值都会指向同一个闭包
let alsoIncrementByTen = incrementByTen
print(alsoIncrementByTen())
// 返回的值为50
