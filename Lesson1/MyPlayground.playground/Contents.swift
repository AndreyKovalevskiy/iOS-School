var inputData: [Int] = [1, 2, 4, 1]

/// The mean for an array of integers
/// - Parameter inputData:The array of integers with an amount greater than 2
/// - Returns: The mean; otherwise, nil.
func mean(for inputData: [Int]) -> Double? {
    if inputData.count < 2 { return nil }
    var sum = 0
    let count = inputData.count
    for element in inputData {
        sum += element
    }
    let mean = Double(sum) / Double(count)
    return mean
}

/// The median for an array of integers
/// - Parameter inputData: The array of integers with an amount greater than 2
/// - Returns: The median; otherwise, nil.
func median(for inputData: [Int]) -> Double? {
    if inputData.count < 2 { return nil }
    var array = inputData
    var median: Double?
    for j in 1..<array.count {
        let key = array[j]
        var i = j - 1
        while i >= 0 && array[i] > key {
            array[i + 1] = array[i]
            i -= 1
        }
        array[i + 1] = key
    }
    if array.count.isMultiple(of: 2) {
        let firstIndex = array.count / 2
        let secondIndex = (array.count / 2) - 1
        median = Double(array[firstIndex] + array[secondIndex]) / 2
    } else {
        let index = array.count / 2
        median = Double(array[index])
    }
    return median
}

/// The moda for an array of integers
/// - Parameter inputData: The array of integers with an amount greater than 2
/// - Returns: The moda; otherwise, nil.
func moda(for inputData: [Int]) -> [Int]? {
    if inputData.count < 2 { return nil }
    var dictionary: [Int:Int] = [:]
    var moda: [Int]?
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
            (moda?.append(key)) ?? (moda = [key])
            maxValue = value
        } else if value == maxValue && value > 1 {
            moda?.append(key);
        }
    }
    return moda
}

print(mean(for: inputData))
print(median(for: inputData))
print(moda(for: inputData))
