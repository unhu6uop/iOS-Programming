import SwiftUI

struct AlarmClockView: View {

    @State private var selectedDate = Date()
    
    var body: some View {
        ScrollView {
            VStack() {
                
                AlarmClockView("알람 예약", selection: $selectedDate,
                           displayedComponents: [.hourAndMinute])
                
                TimelineView(.periodic(from: .now, by: 30)) { context in
                    let calendar = Calendar.current
                    let target = calendar.nextDate(
                        after: context.date,
                        matching: calendar.dateComponents([.hour, .minute], from: selectedDate),
                        matchingPolicy: .nextTime
                    ) ?? selectedDate

                    let totalMinutes = Int(target.timeIntervalSince(context.date) / 60)

                    Text("\(totalMinutes / 60)시간 \(totalMinutes % 60)분 후")
                        .font(.title2.bold())
                }
            }
            .padding()
        }
    }
}

#Preview {
    AlarmClockView()
}
