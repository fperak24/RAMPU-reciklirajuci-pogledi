import SwiftUI

private enum VrstaTablice: String, CaseIterable, Identifiable {
    case grid = "Grid"
    case stack = "Stack"
    case table = "Table"

    var id: String { rawValue }
}

struct TablicaView: View {
    @State private var vrstaTablice: VrstaTablice = .grid

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 14) {
                Text("Usporedba triju rasporeda istih proizvoda")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                Picker("Vrsta prikaza", selection: $vrstaTablice) {
                    ForEach(VrstaTablice.allCases) { vrsta in
                        Text(vrsta.rawValue).tag(vrsta)
                    }
                }
                .pickerStyle(.segmented)

                switch vrstaTablice {
                case .grid:
                    ScrollView {
                        tablicaGrid
                    }

                case .stack:
                    ScrollView {
                        tablicaStack
                    }

                case .table:
                    Text("Na iPhoneu Table prikazuje samo prvi stupac.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                    tablicaTable
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Tablični prikaz")
        }
    }

    // Grid usklađuje stupce između svih redaka.
    private var tablicaGrid: some View {
        Grid(alignment: .leading, horizontalSpacing: 10, verticalSpacing: 12) {
            GridRow {
                Text("Naziv").bold()
                Text("Kategorija").bold()
                Text("Cijena").bold()
            }

            ForEach(DemoPodaci.proizvodi) { proizvod in
                GridRow {
                    Text(proizvod.naziv)
                        .lineLimit(1)
                        .minimumScaleFactor(0.7)
                    Text(proizvod.kategorija)
                        .lineLimit(1)
                        .minimumScaleFactor(0.8)
                    Text("\(proizvod.cijena) €")
                        .lineLimit(1)
                }
            }
        }
        .font(.caption)
        .padding(10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.secondarySystemGroupedBackground))
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }

    // Svaki je redak zaseban HStack unutar VStacka.
    private var tablicaStack: some View {
        VStack(spacing: 0) {
            ForEach(DemoPodaci.proizvodi) { proizvod in
                HStack {
                    Text(proizvod.naziv)
                    Spacer()
                    Text("\(proizvod.cijena) €")
                        .bold()
                }
                .padding(12)
                Divider()
            }
        }
        .background(Color(.secondarySystemGroupedBackground))
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }

    // Na kompaktnom iPhone zaslonu drugi je stupac skriven.
    private var tablicaTable: some View {
        Table(DemoPodaci.proizvodi) {
            TableColumn("Naziv", value: \.naziv)
            TableColumn("Kategorija", value: \.kategorija)
        }
        .frame(maxHeight: .infinity)
    }
}
