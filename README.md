# Smart Complaint Management System

A full-stack web application designed for students to raise complaints related to hostel, academic, or college issues, and for admins to manage, track, and resolve them efficiently.

## 🚀 Tech Stack

- **Frontend**: React.js, Tailwind CSS, Axios, Lucide React
- **Backend**: Node.js, Express.js
- **Database**: MySQL
- **Authentication**: JWT (JSON Web Tokens) with bcrypt password hashing

## 📂 Project Structure

```text
smart-complaint/
├── backend/
│   ├── config/         # DB Connection
│   ├── controllers/    # API Logic
│   ├── middleware/     # Auth & Error Handling
│   ├── routes/         # Express Routes
│   └── server.js       # Entry Point
├── frontend/
│   ├── src/
│   │   ├── components/ # Reusable UI
│   │   ├── pages/      # View Components
│   │   ├── services/   # API Service (Axios)
│   │   └── App.jsx     # Routing
└── schema.sql          # Database Schema
```

## 🛠️ Setup Instructions

### 1. Database Setup
1. Open your MySQL client (e.g., MySQL Workbench or Command Line).
2. Run the commands in `schema.sql` to create the database and tables.
   ```bash
   mysql -u root -p < schema.sql
   ```
   *Note: A default admin user is created: `admin@example.com` / `admin123`.*

### 2. Backend Setup
1. Navigate to the `backend` directory:
   ```bash
   cd backend
   ```
2. Install dependencies:
   ```bash
   npm install
   ```
3. Configure Environment Variables:
   Create a `.env` file in the `backend` folder (or edit the existing one):
   ```env
   PORT=5000
   DB_HOST=localhost
   DB_USER=root
   DB_PASSWORD=your_password
   DB_NAME=smart_complaints
   JWT_SECRET=your_jwt_secret
   ```
4. Start the server:
   ```bash
   npm run dev
   ```

### 3. Frontend Setup
1. Navigate to the `frontend` directory:
   ```bash
   cd frontend
   ```
2. Install dependencies:
   ```bash
   npm install
   ```
3. Start the development server:
   ```bash
   npm run dev
   ```
4. Open [http://localhost:5173](http://localhost:5173) in your browser.

## 📡 API Documentation

### Auth Routes
- `POST /api/auth/register` - Student Registration
- `POST /api/auth/login` - User Login (Student/Admin)

### Complaint Routes (Student)
- `GET /api/complaints` - Get student's complaints
- `POST /api/complaints` - Create a new complaint
- `PUT /api/complaints/:id` - Update pending complaint
- `DELETE /api/complaints/:id` - Delete pending complaint

### Admin Routes
- `GET /api/admin/complaints` - View all complaints
- `GET /api/admin/stats` - Dashboard statistics
- `PUT /api/admin/update-status/:id` - Update status & add remark

## 👤 User Roles
1. **Student**: Can register, login, raise complaints, and track their status.
2. **Admin**: Can login, view all complaints, update status (Pending -> In Progress -> Resolved), and see statistics.
