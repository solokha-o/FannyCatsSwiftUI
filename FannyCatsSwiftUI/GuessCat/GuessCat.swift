//
//  GuessCat.swift
//  FannyCatsSwiftUI
//
//  Created by Oleksandr Solokha on 19.10.2020.
//

import SwiftUI

struct GuessCat: View {
    //create 2 instance for guess cat
    @State var firstCat : CatBreedsDataBaseModel? = nil
    @State var secondCat : CatBreedsDataBaseModel? = nil
    //create instance for check answer
    @State var catForChack : CatBreedsDataBaseModel? = nil
    //colour for answer buttons
    @State var colorAnswerButton : Color = .init(.systemTeal)
    //create text label for check answer
    @State var checkAnswerLable = "Let's do it!"
    //create score label for count right answer
    @State var score = 0
    @State var indexCatBreeds = 0
    //create State for answer
    @State var answerTrue = Answer.trueAnswer
    @State var answerFalse = Answer.falseAnswer
    
    var body: some View {
        //configure View
        NavigationView {
            GeometryReader { geometry in
                VStack{
                    GalleryImage(imageCat: catForChack?.image, size: geometry.size.width)
                        .onAppear {
                            setArrayCouple()
                        }
                    Spacer()
                    Button(action: {
                        setArrayCouple()
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
                            if let chackingCat = firstCat {
                                self.checkAnswer(whit: chackingCat)
                            }
                        }, label: {
                            Text(firstCat?.name ?? "")
                                .padding(5)
                                .background(colorAnswerButton)
                                .cornerRadius(10)
                                .foregroundColor(.black)
                        })
                        Spacer()
                        Button(action: {
                            if let chackingCat = secondCat {
                                self.checkAnswer(whit: chackingCat)
                            }
                        }, label: {
                            Text(secondCat?.name ?? "")
                                .padding(5)
                                .background(colorAnswerButton)
                                .cornerRadius(10)
                                .foregroundColor(.black)
                        })
                    }
                    Text(checkAnswerLable)
                    Text("Score: \(score)")
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
    //get random cat for game
    func getRandomCat(from catBreeds: [CatBreedsDataBaseModel]) -> CatBreedsDataBaseModel {
        let randomNumberOfBreed = Int.random(in: catBreeds.indices)
        return catBreedsData[randomNumberOfBreed]
    }
    //set random cat in each answer
    func setArrayCouple() {
        var coupleCats = [CatBreedsDataBaseModel]()
        firstCat = catBreedsData[Int.random(in: catBreedsData.indices)]
        secondCat = catBreedsData[Int.random(in: catBreedsData.indices)]
        if let cat1 = firstCat, let cat2 = secondCat {
            if cat1.name == cat2.name {
                secondCat = catBreedsData[Int.random(in: catBreedsData.indices)]
            }
        }
        
        if let cat1 = firstCat, let cat2 = secondCat {
            coupleCats.append(cat1)
            coupleCats.append(cat2)
        }
        catForChack = coupleCats[Int.random(in: 0...1)]
    }
    //check answer right or wrong and change view
    func checkAnswer(whit cat: CatBreedsDataBaseModel) {
        if let chackingCat = catForChack {
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
}

struct GuessCat_Previews: PreviewProvider {
    static var previews: some View {
        GuessCat()
    }
}
