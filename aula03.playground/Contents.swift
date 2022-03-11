import UIKit

func isPalindrome1(word: String) -> Bool {
    let formattedString = word.folding(options: .diacriticInsensitive, locale: .current).lowercased()
    let reversed = String(formattedString.reversed())
    return formattedString == reversed
}

print(isPalindrome1(word: "Anã"))
