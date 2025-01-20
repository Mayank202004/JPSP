# JPSP - JP's Scholarship Platform

JPSP is an AI-powered mobile application designed to streamline the scholarship application process. This platform is developed using modern technologies to provide a seamless experience for users, administrators, and institutions. 

## Features

- **AI-Powered Recommendations**: Get tailored scholarship suggestions based on your profile.
- **Seamless Application**: Apply for multiple scholarships in one place.
- **Secure User Management**: User data is securely stored and managed.
- **Admin Panel**: A dedicated admin panel for managing scholarships, applications, and users.
- **Real-Time Updates**: Stay updated with the latest scholarship opportunities.

## Tech Stack

### Frontend (Mobile Application)
- **Flutter**: For building a responsive and user-friendly mobile application.

### Backend
- **React.js**: To power the admin panel and backend APIs.
- **MongoDB**: For efficient and scalable database management.

### AI Integration
- Machine learning models to provide personalized scholarship recommendations.

## Installation and Setup

### Prerequisites
- Node.js and npm
- Flutter SDK
- MongoDB installed locally or hosted

### Backend Setup
1. Clone the repository:
   ```bash
   git clone https://github.com/Mayank202004/JPSP.git
   cd JPSP/backend
   ```
2. Install dependencies:
   ```bash
   npm install
   ```
3. Configure environment variables in a `.env` file:
   ```env
   MONGO_URI=your-mongodb-uri
   PORT=5000
   JWT_SECRET=your-secret-key
   ```
4. Start the server:
   ```bash
   npm run dev
   ```
