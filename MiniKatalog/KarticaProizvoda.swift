import SwiftUI

struct KarticaProizvoda: View {
    let proizvod: Proizvod

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: proizvod.simbol)
                .font(.system(size: 35))
                .foregroundStyle(.blue)
                .frame(height: 50)

            Text(proizvod.naziv)
                .font(.headline)
                .lineLimit(1)
                .minimumScaleFactor(0.75)

            Text(proizvod.kategorija)
                .font(.caption)
                .foregroundStyle(.secondary)

            Text("\(proizvod.cijena) €")
                .bold()
        }
        .frame(maxWidth: .infinity, minHeight: 135)
        .padding(12)
        .background(Color(.secondarySystemGroupedBackground))
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }
}
