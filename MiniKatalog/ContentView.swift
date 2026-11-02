import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Popis", systemImage: "list.bullet") {
                PopisView()
            }

            Tab("Mreža", systemImage: "square.grid.2x2") {
                MrezaView()
            }

            Tab("Tablica", systemImage: "tablecells") {
                TablicaView()
            }

            Tab("Kontrole", systemImage: "slider.horizontal.3") {
                KontroleView()
            }
        }
        .tint(.blue)
        .preferredColorScheme(.light)
    }
}

#Preview {
    ContentView()
}
