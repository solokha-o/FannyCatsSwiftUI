//
//  WidgetFannyCatsSwiftUI.swift
//  WidgetFannyCatsSwiftUI
//
//  Created by Oleksandr Solokha on 10.12.2020.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), catBreed: CatBreedsDataBaseModel.randomCatBreed(in: DataCatBreeds.catBreedsData))
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), catBreed: CatBreedsDataBaseModel.randomCatBreed(in: DataCatBreeds.catBreedsData))
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 24 {
            let entryDate = Calendar.current.date(byAdding: .minute, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, catBreed: CatBreedsDataBaseModel.randomCatBreed(in: DataCatBreeds.catBreedsData))
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let catBreed: CatBreedsDataBaseModel
}

struct WidgetFannyCatsSwiftUIEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        FannyCatsWidgetView(catBreed: entry.catBreed)
//            .widgetURL(entry.catBreed.url)
    }
}

@main
struct WidgetFannyCatsSwiftUI: Widget {
    let kind: String = "WidgetFannyCatsSwiftUI"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            WidgetFannyCatsSwiftUIEntryView(entry: entry)
        }
        .configurationDisplayName("FannyCats widget")
        .description("Show a random image of cat.")
        .supportedFamilies([.systemSmall])
    }
}

struct WidgetFannyCatsSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        WidgetFannyCatsSwiftUIEntryView(entry: SimpleEntry(date: Date(), catBreed: CatBreedsDataBaseModel.randomCatBreed(in: DataCatBreeds.catBreedsData)))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
