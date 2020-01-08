//
//  ContentView.swift
//  SwiftUiBasics
//
//  Created by Haider Khan on 1/6/20.
//  Copyright © 2020 rjt.Alok. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @State var email: String = ""
  @State var password: String = ""
  @State private var showingAlert = false
  @State private var notShowingAlert = false
  @State private var showingAboutUs = false
  @State var backgroudColor = Color.green
  
  //contentView
  @EnvironmentObject var settings: UserSettings
  @EnvironmentObject var test : TextProp

  var body: some View {
    ZStack
           {
               backgroudColor
                   .edgesIgnoringSafeArea(.all)

               // Your other content here
               // Other layers will respect the safe area edges
            NavigationView{
              
                VStack{
                    Image("logo").resizable().aspectRatio(contentMode: ContentMode.fit)
                    .frame(width: CGFloat(150.0), height: CGFloat(150.0)).padding(20)
                    Text("Login").padding(20)
                    Text("Explore the world of Swift UI").padding(20)
                    TextField("Email", text: $email)
                    .background(Color.init(red: 211/255, green: 211/255, blue: 211/255))
                    .cornerRadius(CGFloat(4.0))
                    .padding(20)
                                    
                    SecureField("Password", text: $password) {
                    // submit the password
                    }.background(Color.init(red: 211/255, green: 211/255, blue: 211/255))
                    .cornerRadius(CGFloat(4.0))
                    .padding(20)
                    
                    NavigationLink(destination: DetailView()) {
                    Text("Hello World")
                    }
                
                HStack{
                    Button(action: {
                        self.showingAlert = !self.password.isEmpty || !self.email.isEmpty
                        self.notShowingAlert = self.showingAlert
                    self.test.number = 5
                    self.showingAlert.toggle()
                    print(self.test.number)
                    }) {
                    Text("Login")
                }.padding(20).background(Color.green).cornerRadius(4.0)
                    .sheet(isPresented: $notShowingAlert) {
                        //https://www.hackingwithswift.com/quick-start/swiftui/how-to-present-a-new-view-using-sheets
                                    wrapper()
                }
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("Important message"), message: Text("Wear sunscreen"), dismissButton: .default(Text("Got it!")))
                          }
                          
                    Button(action: {
                    self.settings.score = 2
                    self.settings.name = "Maryna"
                    self.test.number = 4
                    self.showingAboutUs.toggle()
                        print(self.settings.score)
                        print(self.settings.name)
                        print(self.test.number)
                    }) {
                        Text("About Us")
                    }.padding(20).background(Color.green).cornerRadius(4.0)
                        NavigationLink(destination: AboutUs()) {
                        Text("Show About Us")
                        }
                    }
                }
            }
       }
  }
  }

struct DetailView: View {
    var body: some View {
        VStack {
            Text("Second View")
        }.onAppear {
                print("DetailView appeared!")
        }.onDisappear {
                print("DetailView disappeared!")
        }
    }
}


struct wrapper : UIViewControllerRepresentable{
  
  func makeUIViewController(context: UIViewControllerRepresentableContext<wrapper>) -> DetailViewController {
    
    
    let st = UIStoryboard.init(name: "Main", bundle: nil)
    let vc = st.instantiateViewController(identifier: "DetailViewController") as? DetailViewController
    return vc!
  }
  
  func updateUIViewController(_ uiViewController: DetailViewController, context: UIViewControllerRepresentableContext<wrapper>) {
    
  }
    
  typealias UIViewControllerType = DetailViewController
  
  
  
}


