import Foundation
import SwiftData

@Model
final class UserData {
    @Attribute var apiKey: String

    init(apiKey: String) {
        self.apiKey = apiKey
    }
}
