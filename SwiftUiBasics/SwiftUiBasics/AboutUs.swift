//
//  SwiftUIView.swift
//  SwiftUiBasics
//
//  Created by Haider Khan on 1/7/20.
//  Copyright © 2020 rjt.Alok. All rights reserved.
//

import SwiftUI

struct AboutUs: View {
  
  @EnvironmentObject var settings: UserSettings
  @EnvironmentObject var test : TextProp
  
    var body: some View {
       
      ScrollView(.vertical){
        
        VStack{
          Text("Think of @EnvironmentObject as a smarter, simpler way of using @ObservedObject on lots of views. Rather than creating some data in view A, then passing it to view B, then view C, then view D before finally using it, you can create it in view and put it into the environment so that views B, C, and D will automatically have access to it. Note: Environment objects must be supplied by an ancestor view – if SwiftUI can’t find an environment object of the correct type you’ll get a crash. This applies for previews too, so be careful.As an example, here’s an observable object that stores user settings: , Think of @EnvironmentObject as a smarter, simpler way of using @ObservedObject on lots of views. Rather than creating some data in view A, then passing it to view B, then view C, then view D before finally using it, you can create it in view and put it into the environment so that views B, C, and D will automatically have access to it. Note: Environment objects must be supplied by an ancestor view – if SwiftUI can’t find an environment object of the correct type you’ll get a crash. This applies for previews too, so be careful.As an example, here’s an observable object that stores user settings: Think of @EnvironmentObject as a smarter, simpler way of using @ObservedObject on lots of views. Rather than creating some data in view A, then passing it to view B, then view C, then view D before finally using it, you can create it in view and put it into the environment so that views B, C, and D will automatically have access to it. Note: Environment objects must be supplied by an ancestor view – if SwiftUI can’t find an environment object of the correct type you’ll get a crash. This applies for previews too, so be careful.As an example, here’s an observable object that stores user settings: , Think of @EnvironmentObject as a smarter, simpler way of using @ObservedObject on lots of views. Rather than creating some data in view A, then passing it to view B, then view C, then view D before finally using it, you can create it in view and put it into the environment so that views B, C, and D will automatically have access to it. Note: Environment objects must be supplied by an ancestor view – if SwiftUI can’t find an environment object of the correct type you’ll get a crash. This applies for previews too, so be careful.As an example, here’s an observable object that stores user settings: Think of @EnvironmentObject as a smarter, simpler way of using @ObservedObject on lots of views. Rather than creating some data in view A, then passing it to view B, then view C, then view D before finally using it, you can create it in view and put it into the environment so that views B, C, and D will automatically have access to it. Note: Environment objects must be supplied by an ancestor view – if SwiftUI can’t find an environment object of the correct type you’ll get a crash. This applies for previews too, so be careful.As an example, here’s an observable object that stores user settings: , Think of @EnvironmentObject as a smarter, simpler way of using @ObservedObject on lots of views. Rather than creating some data in view A, then passing it to view B, then view C, then view D before finally using it, you can create it in view and put it into the environment so that views B, C, and D will automatically have access to it. Note: Environment objects must be supplied by an ancestor view – if SwiftUI can’t find an environment object of the correct type you’ll get a crash. This applies for previews too, so be careful.As an example, here’s an observable object that stores user settings: Think of @EnvironmentObject as a smarter, simpler way of using @ObservedObject on lots of views. Rather than creating some data in view A, then passing it to view B, then view C, then view D before finally using it, you can create it in view and put it into the environment so that views B, C, and D will automatically have access to it. Note: Environment objects must be supplied by an ancestor view – if SwiftUI can’t find an environment object of the correct type you’ll get a crash. This applies for previews too, so be careful.As an example, here’s an observable object that stores user settings: , Think of @EnvironmentObject as a smarter, simpler way of using @ObservedObject on lots of views. Rather than creating some data in view A, then passing it to view B, then view C, then view D before finally using it, you can create it in view and put it into the environment so that views B, C, and D will automatically have access to it. Note: Environment objects must be supplied by an ancestor view – if SwiftUI can’t find an environment object of the correct type you’ll get a crash. This applies for previews too, so be careful.As an example, here’s an observable object that stores user settings: TEST=> \(settings.score)")
          .fixedSize(horizontal: false, vertical: true)
        }
      }
        
    }
}

struct AboutUs_Previews: PreviewProvider {
    static var previews: some View {
        AboutUs()
    }
}
