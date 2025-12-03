import SwiftUI

struct ContentView: View {
    @State private var playerCards: [Int] = []
    @State private var bankerCards: [Int] = []

    var playerTotal: Int {
        playerCards.reduce(0, +) % 10
    }

    var bankerTotal: Int {
        bankerCards.reduce(0, +) % 10
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("百家樂計算機")
                .font(.largeTitle)

            VStack {
                Text("閒家牌：\(playerCards.map { "\($0)" }.joined(separator: ", "))")
                Text("閒家總點數：\(playerTotal)")
            }

            VStack {
                Text("莊家牌：\(bankerCards.map { "\($0)" }.joined(separator: ", "))")
                Text("莊家總點數：\(bankerTotal)")
            }

            HStack {
                ForEach(0..<10) { i in
                    Button("\(i)") {
                        if playerCards.count < 3 {
                            playerCards.append(i)
                        }
                    }
                    .padding(8)
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(5)
                }
            }

            HStack {
                ForEach(0..<10) { i in
                    Button("\(i)") {
                        if bankerCards.count < 3 {
                            bankerCards.append(i)
                        }
                    }
                    .padding(8)
                    .background(Color.red.opacity(0.2))
                    .cornerRadius(5)
                }
            }

            Button("清除") {
                playerCards.removeAll()
                bankerCards.removeAll()
            }
            .foregroundColor(.white)
            .padding()
            .background(Color.gray)
            .cornerRadius(8)
        }
        .padding()
    }
}

