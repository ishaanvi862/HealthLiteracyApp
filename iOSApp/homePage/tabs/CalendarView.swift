import SwiftUI

struct CalendarView: View {
    @State private var selectedDate: Date = Date()
    @State private var currentMonth: Date = Date()
    @State private var events: [Date: [String]] = [:]
    @State private var newEventText: String = ""

    let calendar = Calendar.current
    let columns = Array(repeating: GridItem(.flexible()), count: 7)

    var body: some View {
        VStack(spacing: 12) {
            // MARK: - Header
            HStack {
                Button(action: {
                    currentMonth = calendar.date(byAdding: .month, value: -1, to: currentMonth) ?? currentMonth
                }) {
                    Image(systemName: "chevron.left")
                }

                Spacer()

                Text(monthYearString(from: currentMonth))
                    .font(.title2)
                    .bold()
                    .foregroundColor(ChamaraColors.text)

                Spacer()

                Button(action: {
                    currentMonth = calendar.date(byAdding: .month, value: 1, to: currentMonth) ?? currentMonth
                }) {
                    Image(systemName: "chevron.right")
                }
            }
            .padding(.horizontal)

            // MARK: - Weekday Labels
            HStack {
                ForEach(calendar.shortWeekdaySymbols, id: \.self) { day in
                    Text(day)
                        .font(.caption)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(ChamaraColors.text)
                }
            }

            // MARK: - Calendar Grid
            LazyVGrid(columns: columns, spacing: 8) {
                ForEach(daysInMonth(for: currentMonth), id: \.self) { date in
                    let isToday = calendar.isDateInToday(date)
                    let isSelected = calendar.isDate(date, inSameDayAs: selectedDate)
                    let isInCurrentMonth = calendar.isDate(date, equalTo: currentMonth, toGranularity: .month)

                    Button(action: {
                        selectedDate = date
                    }) {
                        Text("\(calendar.component(.day, from: date))")
                            .frame(width: 36, height: 36)
                            .background(
                                ZStack {
                                    if isSelected {
                                        ChamaraColors.accent
                                            .clipShape(Circle())
                                    } else if isToday {
                                        ChamaraColors.todayBackground

                                            .clipShape(Circle())
                                    }

                                    if isToday {
                                        Circle()
                                            .stroke(ChamaraColors.today, lineWidth: 2)
                                    }
                                }
                            )
                            .foregroundColor(
                                isInCurrentMonth ? ChamaraColors.text : .gray.opacity(0.5)
                            )
                    }
                }
            }


            // MARK: - Events Section
            VStack(alignment: .leading, spacing: 8) {
                Text("Events on \(formattedDate(selectedDate))")
                    .font(.headline)
                    .foregroundColor(ChamaraColors.text)

                // Event List with Delete
                if let dayEvents = events[startOfDay(selectedDate)], !dayEvents.isEmpty {
                    ForEach(dayEvents.indices, id: \.self) { index in
                        HStack {
                            Text("• \(dayEvents[index])")
                                .foregroundColor(ChamaraColors.text)
                            Spacer()
                            Button(action: {
                                deleteEvent(at: index, for: selectedDate)
                            }) {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                        }
                        .padding(.horizontal, 5)
                    }
                } else {
                    Text("No events")
                        .italic()
                        .foregroundColor(.gray)
                }

                // Add New Event
                HStack {
                    TextField("New event...", text: $newEventText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Button("Add") {
                        let trimmed = newEventText.trimmingCharacters(in: .whitespacesAndNewlines)
                        guard !trimmed.isEmpty else { return }
                        let key = startOfDay(selectedDate)
                        events[key, default: []].append(trimmed)
                        newEventText = ""
                    }
                    .padding(.horizontal, 8)
                    .background(ChamaraColors.highlight)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
            }
            .padding(.top)
            .padding(.horizontal)
        }
        .padding()
        .background(ChamaraColors.background.ignoresSafeArea())
    }

    // MARK: - Helpers

    func daysInMonth(for date: Date) -> [Date] {
        guard let monthInterval = calendar.dateInterval(of: .month, for: date),
              let firstWeek = calendar.dateInterval(of: .weekOfMonth, for: monthInterval.start) else {
            return []
        }

        var days: [Date] = []
        for offset in 0..<42 {
            if let day = calendar.date(byAdding: .day, value: offset, to: firstWeek.start) {
                days.append(day)
            }
        }
        return days
    }

    func monthYearString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "LLLL yyyy"
        return formatter.string(from: date)
    }

    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: date)
    }

    func startOfDay(_ date: Date) -> Date {
        return calendar.startOfDay(for: date)
    }

    func deleteEvent(at index: Int, for date: Date) {
        let key = startOfDay(date)
        events[key]?.remove(at: index)
        if events[key]?.isEmpty == true {
            events[key] = nil
        }
    }
}

// MARK: - Chamara Color Palette

struct ChamaraColors {
    static let background = Color(hex: "#F8F4F0")  // soft sand
    static let accent = Color(hex: "#A188A6")      // lavender mauve (selected day)
    static let highlight = Color(hex: "#D6A5D9")   // plum pink (add button)
    static let today = Color(hex: "#B7C0EE")       // blue-violet (today)
    static let text = Color(hex: "#403A45")        // deep slate
    static let todayBackground = Color(hex: "#E7E3F7") // soft lavender-tinted sand

}

// MARK: - Hex Color Extension

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default: (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
