import SwiftUI

struct HomeView: View {
    @EnvironmentObject var coordinator: Coordinator
    private var menuOptions = Page.allCases.filter { $0 != .home }

    var body: some View {
        ZStack {
            Color.lightOffWhite
                .ignoresSafeArea()
            VStack {
                LazyVGrid(columns: Array(repeating: GridItem(), count: 3), spacing: 10) {
                    ForEach(menuOptions, id: \.self) { square in
                        Button {
                            coordinator.push(square)
                        } label: {
                            VStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(.gray)
                                    .frame(width: 80, height: 80)
                                Text(square.rawValue.capitalized)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
                .padding()
            }
        }
    }
}
