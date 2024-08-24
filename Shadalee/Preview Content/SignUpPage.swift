import SwiftUI
import AuthenticationServices // Required for Apple Sign In

struct SignUpView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // Title
                Text("Create an Account")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 40)
                
                // Email Field
                VStack(alignment: .leading) {
                    Text("Email")
                        .font(.headline)
                        .foregroundColor(.gray)
                    
                    TextField("Enter your email", text: $email)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                }
                
                // Password Field
                VStack(alignment: .leading) {
                    Text("Password")
                        .font(.headline)
                        .foregroundColor(.gray)
                    
                    SecureField("Enter your password", text: $password)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                }
                
                // Confirm Password Field
                VStack(alignment: .leading) {
                    Text("Confirm Password")
                        .font(.headline)
                        .foregroundColor(.gray)
                    
                    SecureField("Re-enter your password", text: $confirmPassword)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                }
                
                // Sign-Up Button
                Button(action: {
                    // Handle sign-up action here
                }) {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(8)
                }
                .padding(.top, 20)
                
                // Divider
                HStack {
                    Divider().frame(height: 1).background(Color.gray)
                    Text("OR")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Divider().frame(height: 1).background(Color.gray)
                }
                .padding(.vertical, 20)
                
                // Sign-Up with Google
                .frame(height: 50)
                .cornerRadius(8)
                .padding(.horizontal, 40)
                
                // Sign-Up with Apple
                SignInWithAppleButton(.signUp, onRequest: { request in
                    // Configure Apple Sign-In request here
                }, onCompletion: { result in
                    // Handle Apple Sign-In completion
                })
                .signInWithAppleButtonStyle(.black)
                .frame(height: 50)
                .cornerRadius(8)
                .padding(.horizontal, 40)
                
                Spacer()
                
                // Footer with a link to Login
                HStack {
                    Text("Already have an account?")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    
                    NavigationLink(destination: LoginView()) {
                        Text("Login")
                            .font(.footnote)
                            .foregroundColor(.blue)
                            .bold()
                    }
                }
            }
            .padding(.horizontal, 40)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
