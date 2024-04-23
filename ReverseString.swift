import Foundation

/**
 Function to read the content of a file and return it as a string.
 
 - Parameter fromPath: The path of the file to read.
 - Returns: The content of the file as a string, or nil if an error occurs.
 */
func readFileAsString(fromPath path: String) -> String? {
    do {
        // Read the content of the file at the specified path
        let content = try String(contentsOfFile: path)
        // Return the content as a string
        return content
    } catch {
        // Handle file reading errors
        print("Error reading file: \(error)")
        return nil
    }
}

/**
 Function to reverse a string recursively.
 
 - Parameter str: The string to be reversed.
 - Returns: The reversed string.
 */
func reverseString(_ str: String) -> String {
    // Base case: if the string is empty, return it
    if str.isEmpty {
        return str
    }
    // Recursive case: reverse the substring starting from the second character and append the first character
    let index = str.index(str.endIndex, offsetBy: -1)
    let lastChar = String(str[index])
    let substring = String(str[str.startIndex..<index])
    return lastChar + reverseString(substring)
}

/**
 Function to write content to a file.
 
 - Parameters:
   - fileName: The name of the file to write to.
   - content: The content to write to the file.
 */
func writeToFile(_ fileName: String, _ content: String) {
    do {
        try content.write(toFile: fileName, atomically: true, encoding: .utf8)
        print("Output written to \(fileName)")
    } catch {
        // Handle file writing errors
        print("Error writing to file: \(error)")
    }
}

// File paths
let inputFileName = "input.txt"
let outputFileName = "output.txt"

// Attempt to read the content of the file
if let str = readFileAsString(fromPath: inputFileName) {
    // Reverse the string
    let reversed = reverseString(str)
    // Print the original and reversed strings
    print("Original string: \(str)")
    print("Reversed string: \(reversed)")
    // Write original and reversed strings to output file
    writeToFile(outputFileName, "Original string: \(str)\nReversed string: \(reversed)")
} else {
    // Print an error message if the file couldn't be read
    print("Failed to read the file.")
}
