class Project {
  final String? title, description;

  Project({this.title, this.description});
}

List<Project> projects = [
  Project(
    title: "Perl Car Chrome Service Suite",
    description:
      "Developed the Perl Car Chrome Service Suite, a 4-app ecosystem (Customer, Technician, Manager, Admin) for efficient car service management. Integrated a third-party AI damage detection API for automated vehicle scratch and dent analysis. Improved workflow transparency and service tracking across user roles."
        // "On Flutter V2.* web officially supported on a stable branch. Today I share an Admin panel or you can call it dashboard UI build with flutter. Now you can build your app dashboard using flutter. This dashboard contains almost everything that you need like a chart, table, nice small card for showing info.",
  ),
  Project(
    title: "Medicine Tracker with Doctor Chat System",
    description:
        "Built a feature-rich medication tracker application in Flutter to help users manage prescriptions and medication schedules. Integrated a real-time chat system connecting patients and healthcare professionals for instant communication and consultation. Focused on a secure, intuitive, and health-oriented user experience.",
  ),
  Project(
    title: "Educational Management System (EMS)",
    description:
        "Contributed to a multi-role Educational Management System designed to streamline communication between schools and parents. Implemented modules for marks management, digital certificates, meetings, homework, and timetables. Enhanced accessibility for Admins, Teachers, Parents, and Students.",
  ),
  Project(
    title: "MAA Token – Two-Factor Authentication App",
    description:"Developed a standalone MAA Token application to enhance login security through two-factor authentication. When a user attempts to log in to the MA Portal, a 4-digit OTP is generated and validated for secure access. Ensured data integrity and encryption throughout the authentication flow."
  ),
  Project(
    title: "Audit Module Integration",
    description:"Architected and implemented a dedicated Audit Module that integrates with a serial-port gold weighing machine using custom Dart code. Automated real-time data capture directly from the hardware, achieving 100% accuracy and improving operational efficiency."
  ),
  Project(
    title: "Human Resource Management (HRM) Application",
    description:"Developed and maintained a comprehensive HRM system featuring modules for leave and movement requests with approval workflows, payslip viewing, and PAN updates. Focused on creating a seamless, employee-friendly interface for managing essential HR processes."
  ),
];
