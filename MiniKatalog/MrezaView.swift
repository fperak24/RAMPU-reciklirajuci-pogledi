import SwiftUI

struct MrezaView: View {
    private let stupci = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: stupci, spacing: 12) {
                    ForEach(DemoPodaci.proizvodi) { proizvod in
                        KarticaProizvoda(proizvod: proizvod)
                    }
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Mreža proizvoda")
        }
    }
}
