import SwiftUI
import SwiftData

struct OpeningView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \UserData.apiKey, order: .forward, animation: .smooth) private var userData: [UserData]

    @State private var apiKey: String = ""

    var body: some View {
        NavigationView {
            ZStack {
                Color.lightOffWhite
                    .ignoresSafeArea()
                VStack {
                    Spacer()

                    TextField(apiKey.isEmpty ? "Insert your NookAPI key here" : apiKey, text: $apiKey)
                        .padding()
                        .multilineTextAlignment(.center)
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                        .background(.lightYellow)
                        .foregroundStyle(.buttonBrown)
                        .cornerRadius(16)
                        .overlay {
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.buttonBrown, lineWidth: 2)
                        }
                        .padding(.horizontal)

                    NavigationLink {
                        CoordinatorView()
                    } label: {
                        Text("Login")
                            .font(.system(size: 32, weight: .semibold, design: .rounded))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.appTeal)
                            .foregroundStyle(.offWhite)
                            .cornerRadius(16)
                            .padding()
                    }

                    Spacer()

                    Text("You can apply for an NookAPI key at api.nookipedia.com")
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .foregroundStyle(.buttonBrown)
                        .multilineTextAlignment(.center)
                        .padding()
                }
            }
            .onAppear {
                if !userData.isEmpty {
                    apiKey = userData[0].apiKey
                }
            }
        }.navigationBarBackButtonHidden()
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
    OpeningView()
        .modelContainer(for: UserData.self, inMemory: true)
}
