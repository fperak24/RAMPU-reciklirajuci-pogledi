import SwiftUI

struct KontroleView: View {
    @State private var kategorija = "Sve"
    @State private var prikaziIndikator = false

    private let kategorije = ["Sve", "Oprema", "Računala"]

    private var filtriraniProizvodi: [Proizvod] {
        if kategorija == "Sve" {
            return DemoPodaci.proizvodi
        }

        return DemoPodaci.proizvodi.filter {
            $0.kategorija == kategorija
        }
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Odabir kategorije")
                        .font(.headline)

                    Picker("Kategorija", selection: $kategorija) {
                        ForEach(kategorije, id: \.self) { naziv in
                            Text(naziv).tag(naziv)
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(height: 140)

                    Text("Broj proizvoda: \(filtriraniProizvodi.count)")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)

                    LazyVStack(alignment: .leading, spacing: 8) {
                        ForEach(filtriraniProizvodi) { proizvod in
                            HStack(spacing: 12) {
                                Image(systemName: proizvod.simbol)
                                    .foregroundStyle(.blue)
                                    .frame(width: 24)
                                Text(proizvod.naziv)
                                Spacer()
                                Text("\(proizvod.cijena) €")
                                    .bold()
                            }
                            .font(.subheadline)
                            .padding(12)
                            .background(Color(.secondarySystemGroupedBackground))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }

                    Divider()
                        .padding(.vertical, 4)

                    Text("Indikatori aktivnosti")
                        .font(.headline)

                    Toggle("Prikaži indikator", isOn: $prikaziIndikator)

                    if prikaziIndikator {
                        ProgressView("Demonstracija indikatora")
                            .padding(.vertical, 8)
                    }

                    Text("Primjer poznatog napretka")
                        .font(.subheadline)

                    ProgressView(value: 0.65, total: 1.0)
                        .progressViewStyle(.linear)

                    Text("65 % — demonstracijska vrijednost")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Kontrole")
        }
    }
}
