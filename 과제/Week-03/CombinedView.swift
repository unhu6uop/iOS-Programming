import SwiftUI

struct CombinedView: View {

    private let images = ["apple", "banana", "grape", "strawberry"]
    private let names  = ["사과", "바나나", "포도", "딸기"]

    @State private var selectedImage = 0
    @State private var date = Date()
    @State private var fitMode = true

    var body: some View {
        VStack(spacing: 16) {

            Group {
                if fitMode {
                    Image(images[selectedImage])
                        .resizable()
                        .scaledToFit()
                } else {
                    Image(images[selectedImage])
                        .resizable()
                        .scaledToFill()
                        .clipped()
                }
            }
            .frame(height: 200)
            .border(.gray.opacity(0.4))

            Toggle("비율 맞추기(Fit)", isOn: $fitMode)

            Picker("사진", selection: $selectedImage) {
                ForEach(images.indices, id: \.self) { i in
                    Text("\(i + 1)").tag(i)
                }
            }
            .pickerStyle(.segmented)
        }
        .padding()
    }
}

#Preview {
    CombinedView()
}
