import UIKit

var inputData = [2, 5, 1, 9, 6, 2]

func mean(for inputData: [Int]) {
    var sum = 0
    let count = inputData.count
    for element in inputData {
        sum += element
    }
    let mean = Double(sum) / Double(count)
    print(mean)
}

func median(for inputData: [Int]) {
    var array = inputData
    for j in 1..<array.count {
        let key = array[j]
        var i = j - 1
        while i >= 0 && array[i] > key {
            array[i + 1] = array[i]
            i -= 1
        }
        array[i + 1] = key
    }
    if array.count % 2 == 0 {
        let key1 = array.count / 2
        let key2 = (array.count / 2) - 1
        let median = Double(array[key1] + array[key2]) / 2
        print(median)
    } else {
        var key = Double(array.count / 2)
        key.round(.up)
        let median = array[Int(key)]
        print(median)
    }
}

func moda(for inputData: [Int]) {
    var dictionary: [Int:Int] = [:]
    var moda: [Int] = []
    for i in 0..<inputData.count {
        let key = inputData[i]
        if let amount = dictionary[key] {
            dictionary[key] = amount + 1
        } else {
            dictionary[key] = 1
        }
    }
    var maxValue = 1
    for (key, value) in dictionary {
        if value > maxValue {
            moda.removeAll()
            moda.append(key);
            maxValue = value
        } else if value == maxValue && value > 1 {
            moda.append(key);
        }
    }
    print(moda)
}

mean(for: inputData)
median(for: inputData)
moda(for: inputData)


