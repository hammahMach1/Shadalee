import SwiftUI

// Step 1: Define a model for action items
struct ActionItem: Identifiable {
    let id = UUID()
    let title: String
    var isCompleted: Bool
}

// Step 2: Modify DashboardView to handle the state of quick actions
struct DashboardView: View {
    @State private var isHeaderVisible = false
    @State private var isSectionVisible = [false, false, false]
    
    @State private var quickActions: [ActionItem] = [
        ActionItem(title: "Check Lab Inventory", isCompleted: false),
        ActionItem(title: "Create New Test Request", isCompleted: false),
        ActionItem(title: "View Recent Reports", isCompleted: false)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 30) {
                    // Header with greeting and profile picture
                    HStack {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.blue)
                        
                        VStack(alignment: .leading) {
                            Text("Welcome, Kwesi Hammah")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                            
                            Text("Snr. Admin Manager")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding(.leading, 10)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 20)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(15)
                    .shadow(radius: 5)
                    .opacity(isHeaderVisible ? 1 : 0)
                    .offset(y: isHeaderVisible ? 0 : -20)
                    .animation(.easeOut(duration: 0.6), value: isHeaderVisible)
                    .onAppear {
                        isHeaderVisible = true
                    }
                    
                    // Section: Important Notifications
                    TextSectionView(title: "Important Notifications", items: [
                        "Lab results for patient ID #1234 are available.",
                        "Annual safety inspection scheduled for next week."
                    ])
                    .opacity(isSectionVisible[0] ? 1 : 0)
                    .offset(y: isSectionVisible[0] ? 0 : 20)
                    .animation(.easeOut(duration: 0.6).delay(0.3), value: isSectionVisible[0])
                    .onAppear {
                        isSectionVisible[0] = true
                    }
                    
                    // Section: Quick Actions
                    ActionSectionView(title: "Quick Actions", items: quickActions, onToggleCompletion: { index in
                        quickActions[index].isCompleted.toggle()
                    })
                    .opacity(isSectionVisible[1] ? 1 : 0)
                    .offset(y: isSectionVisible[1] ? 0 : 20)
                    .animation(.easeOut(duration: 0.6).delay(0.6), value: isSectionVisible[1])
                    .onAppear {
                        isSectionVisible[1] = true
                    }
                    
                    // Section: Recent Activities
                    TextSectionView(title: "Recent Activities", items: [
                        "Reviewed patient samples.",
                        "Completed test for patient ID #5678.",
                        "Updated lab equipment status."
                    ])
                    .opacity(isSectionVisible[2] ? 1 : 0)
                    .offset(y: isSectionVisible[2] ? 0 : 20)
                    .animation(.easeOut(duration: 0.6).delay(0.9), value: isSectionVisible[2])
                    .onAppear {
                        isSectionVisible[2] = true
                    }
                }
                .padding(.horizontal)
                .navigationTitle("Staff Portal")
            }
        }
    }
}

// Step 3: Create separate views for regular text items and action items
struct TextSectionView: View {
    let title: String
    let items: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.blue)
            
            ForEach(items, id: \.self) { item in
                Text("• \(item)")
                    .font(.body)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct ActionSectionView: View {
    let title: String
    let items: [ActionItem]
    var onToggleCompletion: ((Int) -> Void)?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.blue)
            
            ForEach(items.indices, id: \.self) { index in
                HStack {
                    Text("• \(items[index].title)")
                        .font(.body)
                        .foregroundColor(items[index].isCompleted ? .green : .gray)
                    
                    Spacer()
                    
                    if let onToggleCompletion = onToggleCompletion {
                        Button(action: {
                            onToggleCompletion(index)
                        }) {
                            Image(systemName: items[index].isCompleted ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(items[index].isCompleted ? .green : .gray)
                        }
                    }
                }
            }
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

// Step 4: Preview the DashboardView
struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
