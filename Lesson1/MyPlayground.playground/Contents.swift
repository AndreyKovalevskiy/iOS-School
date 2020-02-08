var inputData: [Int] = [1, 3, 9, 5, 1]

/// The mean for an array of integers
/// - Parameter inputData: The array of integers.
/// - Returns: The mean. If the array is empty - nil.
func mean(for inputData: [Int]) -> Double? {
    if inputData.isEmpty { return nil }
    var sum = 0
    for element in inputData {
        sum += element
    }
    let mean = Double(sum) / Double(inputData.count)
    return mean
}

/// The median for an array of integers
/// - Parameter inputData: The array of integers.
/// - Returns: The median. If the array is empty - nil.
func median(for inputData: [Int]) -> Double? {
    if inputData.isEmpty { return nil }
    var array = inputData
    var median: Double?
    array.sort(by: < )
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
/// - Parameter inputData: The array of integers.
/// - Returns: The moda. If the number of elements in the array is less than 2 or if the mode is absent - nil.
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
