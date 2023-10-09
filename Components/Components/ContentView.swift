import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    
    var body: some View {
        TabView {
            NavigationView {
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        SearchBar(searchText: $searchText)
                        ForEach(0..<10) { _ in
                            PropertyRow()
                        }
                    }
                    .padding()
                }
                .navigationBarTitle("Halloween Rentals")
                .background(Color.orange.opacity(0.2))
            }
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            
            Text("Second Tab")
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }
        }
    }
}

struct SearchBar: View {
    @Binding var searchText: String

    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 18))
                .padding(.vertical, 12)
                .foregroundColor(.primary)
                .padding(.leading, 6.0)
            TextField("Where to?", text: $searchText)
                .foregroundColor(.black)
                .fontWeight(.medium)
                .font(.system(size: 14))
                .padding(.trailing)
            Button(action: {}) {
                Image(systemName: "slider.horizontal.3")
                    .font(.headline)
                    .frame(width: 40, height: 40)
                    .background(Color.white)
                    .clipShape(Circle())
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(Color(.systemGray6), lineWidth: 2)
                    )
            }
            .padding(.leading, 0.0)
        }
        .padding(.horizontal, 8.0)
        .background(
            RoundedRectangle(cornerRadius: 40)
                .fill(Color.white)
                .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 0)
        )
    }
}

struct PropertyRow: View {
    var body: some View {
        HStack {
            Image("haunted_house")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipped()
                .cornerRadius(10)

            VStack(alignment: .leading, spacing: 5) {
                Text("Haunted House")
                    .font(.headline)
                    .foregroundColor(.black)

                Text("Spooky Street, Ghost Town")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.orange)

                    Text("4.8")
                        .font(.subheadline)
                        .foregroundColor(.black)
                }
            }
            .padding(.leading, 10)
        }
        .padding(.vertical, 5)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .gray, radius: 2, x: 0, y: 2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}