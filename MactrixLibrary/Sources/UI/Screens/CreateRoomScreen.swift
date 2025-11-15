import SwiftUI

enum RoomAccess: Hashable {
    case publicRoom, privateRoom
}

public struct CreateRoomScreen: View {
    
    @State private var access: RoomAccess = .privateRoom
    @State private var name: String = ""
    @State private var topic: String = ""
    @State private var enableEncryption: Bool = false
    
    public var body: some View {
        VStack(spacing: 40) {
            Spacer()
            VStack(spacing: 10) {
                Image(systemName: "number")
                    .font(.largeTitle)
                Text("Create Room")
                    .font(.largeTitle)
                
                Text("Create a new chat room to start a conversation.")
            }
            
            Form {
                Picker("Access", selection: $access) {
                    VStack(alignment: .leading) {
                        Label("Private", systemImage: "lock")
                            .font(.title3)
                        Text("Only invited people can join.")
                            .font(.subheadline)
                    }
                        .tag(RoomAccess.privateRoom)
                        .padding(.bottom, 8)
                    
                    VStack(alignment: .leading) {
                        Label("Public", systemImage: "globe")
                            .font(.title3)
                        Text("Everyone can join.")
                            .font(.subheadline)
                    }
                        .tag(RoomAccess.publicRoom)
                        .padding(.bottom, 8)
                }.pickerStyle(.radioGroup)
                
                TextField("Name", text: $name)
                    .textFieldStyle(.roundedBorder)
                    .padding(.bottom, 8)
                
                LabeledContent("Topic") {
                    TextEditor(text: $topic)
                        .textEditorStyle(.plain)
                        .padding(6)
                        .background(
                            RoundedRectangle(cornerRadius: 6)
                                .foregroundStyle(Color.white)
                        )
                        .frame(height: 80)
                }
                .padding(.bottom, 8)
                
                Toggle("End to End Encryption", systemImage: "lock", isOn: $enableEncryption)
                Text("Once encryption is enabled, it can not be turned off again.")
                    .font(.subheadline)
                    .padding(.bottom, 8)
                
                Button(action: {}) {
                    Text("Create")
                }
                .buttonStyle(.borderedProminent)
            }.frame(width: 450)
            
            Spacer()
        }
    }
}

#Preview {
    CreateRoomScreen()
        .padding()
        .frame(height: 600)
}
