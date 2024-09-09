SwiftUI Staff Portal Dashboard

This project is a SwiftUI-based dashboard designed for a staff portal. The dashboard provides an interface for staff members to manage quick actions, view important notifications, and track recent activities. The application is tailored for a Senior Administrative Manager and includes interactive features for marking tasks as completed.

Features

•	Personalized Greeting: Displays a welcome message and profile picture for the user.
•	Important Notifications: A section dedicated to displaying critical notifications.
•	Quick Actions: A list of tasks that can be marked as completed. The completion status is saved for easy tracking and reporting.
•	Recent Activities: A section showing the latest activities performed by the user.
Screenshots


Installation

1.	Clone the repository:
git clone https://github.com/yourusername/staff-portal-dashboard.git

2.	Navigate to the project directory:
cd staff-portal-dashboard

Open the project in Xcode: open staff-portal-dashboard.xcodeproj

4.	Build and run the app:
•	Select a simulator or a connected device from the Xcode toolbar.
•	Press Cmd + R to build and run the project.
Code Structure

•	DashboardView.swift: The main view that contains the layout and logic for displaying the dashboard.
•	ActionItem.swift: A model representing the quick actions, with a title and completion status.
•	TextSectionView.swift: A reusable view component for displaying static text sections (e.g., notifications, recent activities).
•	ActionSectionView.swift: A reusable view component for displaying interactive quick actions, allowing users to toggle completion.
Usage

1.	Personalized Dashboard: The dashboard is personalized for “Kwesi Hammah,” a Senior Administrative Manager. Modify the DashboardView to customize it for other users or roles.
2.	Quick Actions: Quick actions can be marked as completed by tapping the circle icon. The status of each action is tracked and can be used for reporting purposes.
3.	Notifications and Activities: These sections display static information that can be customized to fit your application’s needs.
Customization

•	User Information: Update the user’s name and job title in the DashboardView.
•	Action Items: Modify the quickActions array in DashboardView to change the available quick actions.
•	Notifications and Activities: Customize the items displayed in the TextSectionView to suit your application’s context.
Contributing

If you’d like to contribute to this project, please fork the repository and create a pull request. Contributions are welcome, whether it’s a bug fix, feature addition, or documentation improvement.

License

This project is licensed under the MIT License. See the LICENSE file for details.

Contact

For questions or suggestions, please feel free to contact me via hammahmach1@gmail.com.
