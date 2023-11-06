import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \UserData.apiKey, order: .forward, animation: .smooth) private var userData: [UserData]

    @State private var apiKey: String = ""

    var body: some View {

        VStack {
            ForEach(userData) { data in
                Text(data.apiKey)
                    .foregroundStyle(.black)
            }
            Text("Insert your NookAPI key")
            TextField(apiKey.isEmpty ? "Insert here" : apiKey, text: $apiKey)
                .padding(8)
                .background(.gray)
                .foregroundStyle(.white)
                .cornerRadius(8)
                .padding(.horizontal)
            Button {
                saveAPIKey()
            } label: {
                Text("Continue")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.blue)
                    .foregroundStyle(.white)
                    .cornerRadius(8)
                    .padding()
            }
        }
        .onAppear {
            if !userData.isEmpty {
                apiKey = userData[0].apiKey
            }
        }
    }

    private func saveAPIKey() {

        if !userData.isEmpty {
            userData[0].apiKey = apiKey
        } else {
            let data = UserData(apiKey: apiKey)
            modelContext.insert(data)
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: UserData.self, inMemory: true)
}
