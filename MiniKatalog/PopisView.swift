import SwiftUI

struct PopisView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(DemoPodaci.proizvodi) { proizvod in
                    HStack(spacing: 12) {
                        Image(systemName: proizvod.simbol)
                            .font(.title2)
                            .foregroundStyle(.blue)
                            .frame(width: 36)

                        VStack(alignment: .leading, spacing: 4) {
                            Text(proizvod.naziv)
                                .font(.headline)
                            Text(proizvod.kategorija)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }

                        Spacer()

                        Text("\(proizvod.cijena) €")
                            .font(.subheadline)
                            .bold()
                    }
                    .padding(.vertical, 5)
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Popis proizvoda")
        }
    }
}
