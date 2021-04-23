import SwiftUI

struct URLBarView: View {
    @Binding var urlString: String
    @Binding var urlTitle: String
    @Binding var isBookmarked: Bool
    @Binding var isReloading: Bool
    
    //This ensures we don't update the url too early before submission of
    //the text
    @State var urltoEdit: String = ""
    
    
    var body: some View {
        VStack {
            HStack{
                HStack{
                    Image(systemName: "globe")
                        .padding(.horizontal, 2)
                        .foregroundColor(Color.accentColor)
                    
                    TextField("Enter URL...",text: $urltoEdit, onCommit: {commitURL()})
                        .foregroundColor(Color("TextColor"))
                        .padding(4)
                        .font(.footnote)
                        .keyboardType(.webSearch)
                 
                    
                    Spacer()
                    //Add current text val to bookmarks
                    Button(action:{
                        isReloading = true
                    }) {
                        Image(systemName: "arrow.clockwise")
                            .font(.system(size:16))
                            .foregroundColor(Color.accentColor)
                            .padding(.horizontal, 5)
                    }
                }
                .padding(5)
                .cornerRadius(4.0)
                .background(Capsule().strokeBorder(Color("TextColor"), lineWidth: 1.25 ))
//                Button(action: {
//                }) {
//                    
//                    Image(systemName: "ellipsis")
//                        .font(.title)
//                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)
            .padding(.bottom, 5)
        }
        
    }
    
    func commitURL(){
        if !urltoEdit.isEmpty{
            urlString = urltoEdit.lowercased()
            print("committed url \(urlString)")
        }
    }
}

struct URLBarView_Previews: PreviewProvider {
    static var previews: some View {
        let url: Binding = .constant("www.google.com")
        let title: Binding = .constant("Google")
        let isBookm: Binding = .constant(false)
        let bool: Binding = .constant(false)

        URLBarView(urlString: url, urlTitle: title, isBookmarked: isBookm, isReloading: bool)
        URLBarView(urlString: url, urlTitle: title, isBookmarked: isBookm, isReloading: bool)
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
