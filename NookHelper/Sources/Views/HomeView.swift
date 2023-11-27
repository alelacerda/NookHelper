import SwiftUI

enum MenuOptions: String, CaseIterable {
    case villagers, fish, fossils, bugs, seaCreatures, items, calculator, music, art
}

struct HomeView: View {
    @State private var selectedSquare: MenuOptions?

    var body: some View {
        ZStack {
            Color.lightOffWhite
                .ignoresSafeArea()
            VStack {
                Text("Tap a square to display its text:")
                    .font(.headline)
                    .padding()

                LazyVGrid(columns: Array(repeating: GridItem(), count: 3), spacing: 10) {
                    ForEach(MenuOptions.allCases, id: \.self) { square in
                        Button {
                            selectedSquare = square
                        } label: {
                            VStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(selectedSquare == square ? .blue : .gray)
                                    .frame(width: 80, height: 80)
                                Text(square.rawValue.capitalized)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
                .padding()

                if let selectedSquare = selectedSquare {
                    Text("Selected Square: \(selectedSquare.rawValue)")
                        .font(.title)
                        .padding()
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}
