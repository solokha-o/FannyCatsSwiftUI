//
//  GuessCat.swift
//  FannyCatsSwiftUI
//
//  Created by Oleksandr Solokha on 19.10.2020.
//

import SwiftUI

struct GuessCat: View {
    // create enum for answer true or false
    enum Answer {
        case trueAnswer, falseAnswer
        
        var answerLabel: String {
            switch self {
            case .trueAnswer: return "You are right 👍"
            case .falseAnswer: return "You are wrong 👎"
            }
        }
        var colorButton: Color {
            switch self {
            case .trueAnswer: return .green
            case .falseAnswer: return .red
            }
        }
    }
    
    //colour for answer buttons
    @State var colorAnswerButton : Color = .init(.systemTeal)
    //create text label for check answer
    @State var checkAnswerLable = "Let's do it!"
    //create State for answer
    @State var answerTrue = Answer.trueAnswer
    @State var answerFalse = Answer.falseAnswer
    //create score for count right answer
    @State var score = 0
    //create instance of GuessCatModel
    @State var guessCat = GuessCatModel()
    
    var body: some View {
        //configure View
        NavigationView {
            GeometryReader { geometry in
                VStack{
                    GalleryImage(imageCat: guessCat.catForChack?.image, size: geometry.size.width)
                        .onAppear {
                            guessCat.setArrayCouple()
                        }
                    Spacer()
                    Button(action: {
                        guessCat.setArrayCouple()
                        checkAnswerLable = "Let's do it!"
                        colorAnswerButton = Color.init(.systemTeal)
                    }, label: {
                        Text("Next cat🐈")
                            .padding(5)
                            .background(Color.init(.systemTeal))
                            .cornerRadius(10)
                            .foregroundColor(.black)
                    })
                    Spacer()
                    HStack{
                        Button(action: {
                            if let chackingCat = guessCat.firstCat {
                                self.checkAnswer(whit: chackingCat, in: guessCat)
                            }
                        }, label: {
                            Text(guessCat.firstCat?.name ?? "")
                                .padding(5)
                                .background(colorAnswerButton)
                                .cornerRadius(10)
                                .foregroundColor(.black)
                        })
                        Spacer()
                        Text("Score: \(score)")
                        Spacer()
                        Button(action: {
                            if let chackingCat = guessCat.secondCat {
                                self.checkAnswer(whit: chackingCat, in: guessCat)
                            }
                        }, label: {
                            Text(guessCat.secondCat?.name ?? "")
                                .padding(5)
                                .background(colorAnswerButton)
                                .cornerRadius(10)
                                .foregroundColor(.black)
                        })
                    }
                    Spacer()
                    Text(checkAnswerLable)
                }
            }
            .padding(25)
            .navigationBarTitle("Guess cat", displayMode: .automatic)
        }
        .onAppear() {
            UINavigationBar.appearance().barTintColor = .systemTeal
            UINavigationBar.appearance().backgroundColor = .systemTeal
        }
    }
    //check answer right or wrong and change view
    func checkAnswer(whit cat: CatBreedsDataBaseModel, in guessCat: GuessCatModel) {
        if let chackingCat = guessCat.catForChack {
            if cat.name == chackingCat.name {
                colorAnswerButton = answerTrue.colorButton
                checkAnswerLable = answerTrue.answerLabel
                score += 1
            } else {
                colorAnswerButton = answerFalse.colorButton
                checkAnswerLable = answerFalse.answerLabel
            }
        }
    }
}

struct GuessCat_Previews: PreviewProvider {
    static var previews: some View {
        GuessCat()
    }
}
