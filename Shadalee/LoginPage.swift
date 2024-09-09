import SwiftUI
import AuthenticationServices

struct LoginView: View {
    @State private var id: String = ""
    @State private var password: String = ""
    @State private var isAuthenticated = false
    @State private var authenticationFailed = false
    @State private var showSignup = false
    @State private var isLogoScaled = true
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Soft Background
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.2), Color.gray.opacity(0.1)]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    // Logo and Title
                    VStack {
                        Image("kbthlogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: isLogoScaled ? UIScreen.main.bounds.width : 120, height: isLogoScaled ? UIScreen.main.bounds.width : 120)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .shadow(radius: 10)
                            .onAppear {
                                withAnimation(.spring(response: 1.0, dampingFraction: 0.6, blendDuration: 1)) {
                                    isLogoScaled = false
                                }
                            }
                        
                        Text("Korle Bu Teaching Hospital")
                            .font(.title3.bold())
                            .foregroundStyle(.primary)
                            .padding(.top, 5)
                    }
                    
                    // Input Fields
                    VStack(spacing: 15) {
                        CustomTextField(icon: "person.fill", placeholder: "Staff ID", text: $id, isSecure: false)
                        CustomTextField(icon: "lock.fill", placeholder: "Password", text: $password, isSecure: true)
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    
                    // Login Button
                    Button(action: { authenticateUser() }) {
                        Text("Login")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green.gradient)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .shadow(radius: 8)
                    }
                    .padding(.top, 10)
                    
                    if authenticationFailed {
                        Text("Invalid Staff ID or Password")
                            .font(.footnote)
                            .foregroundColor(.red)
                    }
                    
                    // Sign-up Link
                    HStack {
                        Text("Don't have an account?")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                        
                        Button(action: { showSignup = true }) {
                            Text("Sign Up")
                                .font(.footnote.bold())
                                .foregroundColor(.blue)
                        }
                    }
                    .padding(.top, 5)
                }
                .padding(.horizontal, 30)
            }
            .navigationDestination(isPresented: $isAuthenticated) { DashboardView() }
            .sheet(isPresented: $showSignup) { SignupView() }
        }
    }
    
    func authenticateUser() {
        if let staffID = Int(id), staffID == 2024 && password == "1234" {
            isAuthenticated = true
        } else {
            authenticationFailed = true
        }
    }
}

// MARK: - Custom TextField with SF Symbol
struct CustomTextField: View {
    var icon: String
    var placeholder: String
    @Binding var text: String
    var isSecure: Bool
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.gray)
            
            if isSecure {
                SecureField(placeholder, text: $text)
            } else {
                TextField(placeholder, text: $text)
                    .keyboardType(.numberPad)
            }
        }
        .padding()
        .background(.thinMaterial)
        .cornerRadius(10)
        .shadow(radius: 2)
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
