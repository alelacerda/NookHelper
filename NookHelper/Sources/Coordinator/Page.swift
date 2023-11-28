import Foundation

enum Page: String, Identifiable, CaseIterable {
    case home, villagers, fish, fossils, bugs, seaCreatures, items, calculator, music, art

    var id: String {
        self.rawValue
    }
}
