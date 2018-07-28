//
//  QuestionData.swift
//  PersonalityQuiz
//
//  Created by Emma Tucker on 7/24/18.
//  Copyright © 2018 Emma Tucker. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}

struct Answer {
    var text: String
    var type: Disaster
}

enum Disaster: Character {
    case Tornado = "🌪", Wildfire = "🔥", Tsunami = "🌊", Blizzard = "❄️"
    
    var definition: String {
        switch self {
        case .Blizzard:
            return "Buy extra milk and blankets a Blizzard! You're a difficult person to get to know, but once someone does, you're quite angelic and refreshing. You tend to be introverted and enjoy reading with a warm blanket at home."
        case .Tornado:
            return "Find cover a Tornado! You tend to be an active person who blows off some steam by playing sports or exercising. You're intense in nature, with a strong focus on what you choose to do."
        case .Tsunami:
            return "Go to high ground a Tsunami! You're a very social person who tends to make an impact on many people at once. Your mood changes in waves, but overall you can be quite serene and fluid."
        case .Wildfire:
            return "Run away and cover your mouth a Wildfire! You're very charismatic and easy to talk to. You can experience extreme emotions and sometimes do things you regret, but you're typically quite lively and fun when in a good mood."
        }
    }
}
