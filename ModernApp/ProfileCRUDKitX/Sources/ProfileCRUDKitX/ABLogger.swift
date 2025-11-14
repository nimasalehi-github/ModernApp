//
//  ABLogger.swift
//  
//
//  Created by Nima Salehi on 11/14/25.
//
//  ProfileCRUDKitX
//
//

import Foundation

public enum ABLogger {

    /// serial queue for thread-safety
    private static let queue = DispatchQueue(label: "ABLogger.queue")

    /// Encode any encodable to JSON string
    private static func encodeJSON<T: Encodable>(_ value: T) -> String {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        return (try? String(data: encoder.encode(value), encoding: .utf8)) ?? "<encode-failed>"
    }

    /// Main log function
    public static func log(
        file: String = #file,
        function: String = #function,
        line: Int = #line,
        event: String,
        input: Encodable? = nil,
        output: Encodable? = nil
    ) {
        queue.async {
            var logText = "\n----- 🟦 ABLogger EVENT -----\n"
            logText += "📄 File: \((file as NSString).lastPathComponent)\n"
            logText += "🔧 Function: \(function)\n"
            logText += "🔢 Line: \(line)\n"
            logText += "📝 Event: \(event)\n"

            if let input = input {
                logText += "\n⬅️ INPUT JSON:\n\(encodeJSON(input))\n"
            }

            if let output = output {
                logText += "\n➡️ OUTPUT JSON:\n\(encodeJSON(output))\n"
            }

            logText += "-------------------------------\n"

            print(logText)
        }
    }
}
