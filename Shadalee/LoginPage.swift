import SwiftUI
import AuthenticationServices

struct LoginView: View {
    @State private var id: String = "" // Store Staff ID as a String for the TextField
    @State private var password: String = ""
    @State private var isAuthenticated = false
    @State private var authenticationFailed = false
    @State private var showSignup = false // State to handle navigation to SignupView
    
    // State variables for animation
    @State private var isLogoScaled = true
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                // Logo and Title
                VStack {
                    Image("kbthlogo") // Logo image, ensure the name matches the asset catalog
                        .resizable()
                        .scaledToFit()
                        // Scale the logo from full screen to its spot
                        .frame(width: isLogoScaled ? UIScreen.main.bounds.width : 100, height: isLogoScaled ? UIScreen.main.bounds.width : 100)
                        .shadow(radius: 50)
                        .onAppear {
                            // Animate the logo when the view appears
                            withAnimation(.easeInOut(duration: 1.0)) {
                                isLogoScaled = false
                            }
                        }
                    
                    Text("Korle Bu Teaching Hospital")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                        .padding(.top, 20.0)
                }

                // Staff ID Field
                VStack(alignment: .leading) {
                    Text("Staff ID")
                        .font(.headline)
                        .foregroundColor(.gray)
                    
                    TextField("Enter your Staff ID", text: $id)
                        .keyboardType(.numberPad) // Ensure the keyboard shows numbers
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
                
                // Login Button
                Button(action: {
                    authenticateUser() // Call the authentication function
                }) {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(8)
                        .shadow(radius: 50)
                }
                .padding(.top, 20)
                
                // Error message for failed authentication
                if authenticationFailed {
                    Text("Invalid username or password")
                        .foregroundColor(.red)
                        .font(.footnote)
                }
                
                Spacer()
                
                // Footer with a link to Sign Up
                HStack {
                    Text("Don't have an account?")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    
                    Button(action: {
                        showSignup = true // Navigate to SignupView
                    }) {
                        Text("Sign Up")
                            .font(.footnote)
                            .foregroundColor(.blue)
                            .bold()
                    }
                }
            }
            .padding(.horizontal, 40)
            // Navigation to DashboardView if authentication is successful
            .navigationDestination(isPresented: $isAuthenticated) {
                DashboardView()
            }
            // Navigation to SignupView
            .sheet(isPresented: $showSignup) {
                SignupView()
            }
        }
    }
    
    // Function to authenticate the user
    func authenticateUser() {
        // Convert id to Int and check if the entered credentials match
        if let staffID = Int(id), staffID == 2024 && password == "1234" {
            isAuthenticated = true // Navigate to the Dashboard
        } else {
            authenticationFailed = true // Show error message
        }
    }
}

struct SignupView: View {
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Create Account")
                .font(.largeTitle)
                .fontWeight(.bold)

            // Email Sign-Up Field
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

            // Password Sign-Up Field
            VStack(alignment: .leading) {
                Text("Password")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                SecureField("Enter your password", text: $password)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                    )
            }

            // Sign Up Button
            Button(action: {
                // Handle email sign-up logic
            }) {
                Text("Sign Up with Email")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(8)
            }

            // Apple Sign-Up Button
            SignInWithAppleButton(
                .signUp,
                onRequest: { request in
                    // Customize Apple sign-up request
                },
                onCompletion: { result in
                    // Handle Apple sign-up completion
                }
            )
            .signInWithAppleButtonStyle(.black)
            .frame(height: 45)
            .cornerRadius(8)

            Spacer()
        }
        .padding(.horizontal, 40)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
